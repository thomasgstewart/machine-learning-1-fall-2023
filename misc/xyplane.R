
pdf("xyplane.pdf", width=2, height=2)
par(mar = rep(0,4))
plot.new()
plot.window(c(-1,1),c(-1,1),asp=1)
abline(h=seq(-1,1,by=0.2), col = "gray80")
abline(v=seq(-1,1,by=0.2), col = "gray80")
abline(h=0,v=0,lwd=3)
dev.off()

pdf("xyplane-stretch.pdf", width=2, height=2)
par(mar = rep(0,4))
plot.new()
plot.window(c(-1,1),c(-1,1),asp=1)

E <- matrix(c(1,1,-1,1),2,2)
V <- matrix(c(2,2,-1,1),2,2)
M <- V %*% solve(E)

for(x in seq(-1,1,by=0.2)){
p1 <- M %*% rbind(rep(x,11), seq(-1,1,by=0.2))
lines(t(p1), col = "gray80")
}

for(y in seq(-1,1,by=0.2)){
p1 <- M %*% rbind(seq(-1,1,by=0.2), rep(y,11))
lines(t(p1), col = "gray80")
}

p1 <- M %*% rbind(rep(0,11), seq(-1,1,by=0.2))
lines(t(p1),lwd=3)

p1 <- M %*% rbind(seq(-1,1,by=0.2), rep(0,11))
lines(t(p1),lwd=3)
dev.off()