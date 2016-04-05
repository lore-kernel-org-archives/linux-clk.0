Return-Path: <joe@perches.com>
Message-ID: <1459891815.6715.15.camel@perches.com>
Subject: Re: [PATCH] clk: ti: dflt: remove redundant unlikely
From: Joe Perches <joe@perches.com>
To: Suman Anna <s-anna@ti.com>, Tero Kristo <t-kristo@ti.com>, Andrew Morton
	 <akpm@linux-foundation.org>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@codeaurora.org>, linux-omap@vger.kernel.org,
 linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org
Date: Tue, 05 Apr 2016 14:30:15 -0700
In-Reply-To: <1459880937-22349-1-git-send-email-s-anna@ti.com>
References: <1459880937-22349-1-git-send-email-s-anna@ti.com>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Tue, 2016-04-05 at 13:28 -0500, Suman Anna wrote:
> Commit 7aba4f5201d1 ("clk: ti: dflt: fix enable_reg validity check")
> fixed a validation check by using an IS_ERR() macro within the
> existing unlikely expression, but IS_ERR() macro already has an
> unlikely inside it, so get rid of the redundant unlikely macro
> from the validation check.
[]
> diff --git a/drivers/clk/ti/clkt_dflt.c b/drivers/clk/ti/clkt_dflt.c
[]
> @@ -222,7 +222,7 @@ int omap2_dflt_clk_enable(struct clk_hw *hw)
>  		}
>  	}
>  
> -	if (unlikely(IS_ERR(clk->enable_reg))) {
> +	if (IS_ERR(clk->enable_reg)) {
>  		pr_err("%s: %s missing enable_reg\n", __func__,
>  		       clk_hw_get_name(hw));
>  		ret = -EINVAL;

There are several of these:

$ git grep -n -E "likely.*\bIS_ERR\s*\(" *
drivers/clk/ti/clkt_dflt.c:225: if (unlikely(IS_ERR(clk->enable_reg))) {
drivers/md/dm-verity-fec.c:76:  if (unlikely(IS_ERR(res))) {
drivers/md/dm-verity-fec.c:168:                 if (unlikely(IS_ERR(par)))
drivers/md/dm-verity-fec.c:253:         if (unlikely(IS_ERR(bbuf))) {
drivers/net/ethernet/broadcom/bnxt/bnxt.c:1109:         if (unlikely(IS_ERR(skb)))
drivers/net/ethernet/hisilicon/hns/hns_enet.c:1010:     if (unlikely(!phy_dev) || IS_ERR(phy_dev))
drivers/net/ethernet/sun/ldmvsw.c:302:  if (unlikely(IS_ERR(vp))) {
drivers/scsi/bnx2fc/bnx2fc_fcoe.c:2547: if (likely(!IS_ERR(thread))) {
drivers/scsi/bnx2i/bnx2i_init.c:431:    if (likely(!IS_ERR(thread))) {
drivers/scsi/fcoe/fcoe.c:1263:  if (likely(!IS_ERR(thread))) {
drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c:1500:               if (likely(!IS_ERR(pfmr))) {
drivers/thermal/intel_powerclamp.c:541:         if (likely(!IS_ERR(thread))) {
drivers/thermal/intel_powerclamp.c:591:         if (likely(!IS_ERR(thread))) {
drivers/tty/serial/serial_core.c:2682:  if (likely(!IS_ERR(tty_dev))) {
fs/gfs2/dir.c:854:      if (unlikely(dent == NULL || IS_ERR(dent))) {
fs/ntfs/inode.c:2724:   if (unlikely(err || IS_ERR(m))) {
fs/ntfs/lcnalloc.c:744: if (likely(page && !IS_ERR(page))) {
fs/ntfs/mft.c:85:       if (likely(!IS_ERR(page))) {
fs/ntfs/mft.c:168:      if (likely(!IS_ERR(m)))
fs/ntfs/mft.c:285:              if (likely(!IS_ERR(m))) {
fs/ntfs/mft.c:1311:     if (unlikely(IS_ERR(rl) || !rl->length || rl->lcn < 0)) {
fs/ntfs/mft.c:1742:     if (unlikely(IS_ERR(rl) || !rl->length || rl->lcn < 0)) {
fs/ntfs/mft.c:1784:             if (likely(!IS_ERR(rl2)))
fs/ntfs/namei.c:132:            if (likely(!IS_ERR(dent_inode))) {
fs/ntfs/runlist.c:968:  if (likely(!IS_ERR(old_rl)))
fs/ntfs/super.c:1492:   if (unlikely(IS_ERR(tmp_ino) || is_bad_inode(tmp_ino))) {
net/ipv6/addrconf.c:3212:               if (unlikely(IS_ERR(rt)))
net/kcm/kcmsock.c:1969: if (unlikely(IS_ERR(newfile))) {
net/openvswitch/datapath.c:1315:                if (likely(!IS_ERR(reply))) {
net/socket.c:399:       if (likely(!IS_ERR(newfile))) {

Maybe a new checkpatch test like:
---
 scripts/checkpatch.pl | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index e3d9c34..25e81b9 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -5734,6 +5734,13 @@ sub process {
 			}
 		}
 
+# check for IS_ERR with likely
+
+		if ($line =~ /\b((?:un)?likely)\s*\(\s*\!?\s*IS_ERR\s*\(/) {
+			WARN("IS_ERR_IS_UNLIKELY",
+			     "Using $1 isn't recommended as IS_ERR already uses unlikely\n" . $herecurr);
+		}
+
 # check for semaphores initialized locked
 		if ($line =~ /^.\s*sema_init.+,\W?0\W?\)/) {
 			WARN("CONSIDER_COMPLETION",
