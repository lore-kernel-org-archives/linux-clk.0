Return-Path: <SRS0=bPXJ=OW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,T_MIXED_ES,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81755C67839
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 04:52:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 132CE2080F
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 04:52:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YAPOIN9t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 132CE2080F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727245AbeLMEwS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 12 Dec 2018 23:52:18 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:39074 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726465AbeLMEwS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 12 Dec 2018 23:52:18 -0500
Received: from avalon.localnet (dfj612ybrt5fhg77mgycy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:2e86:4862:ef6a:2804])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A1B46549;
        Thu, 13 Dec 2018 05:52:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1544676731;
        bh=6Yj4csRFGOt+HLb/CBclizxg+zejsVIyuRwavHsUs4M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YAPOIN9t4xvSVDE+s7bVJr6HAbcPaGQUeRdgseKgFiCae84CPI0fLj0x5UK9UVF2H
         lOkGD84WFYT/Ku/5ndv7XYP1sZwIYJ61xqOLV3G1b+lqZUeRqNWjrHPCWOO+WCGX//
         Z1l/P/C01VMOMbWHp61OI70eqcThMO9waToJgks4=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Marek Vasut <marek.vasut@gmail.com>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Alexey Firago <alexey_firago@mentor.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH V2] clk: vc5: Add suspend/resume support
Date:   Thu, 13 Dec 2018 06:52:56 +0200
Message-ID: <3136523.fA2jzEL6tu@avalon>
Organization: Ideas on Board Oy
In-Reply-To: <904df663-92e1-7891-b897-9cd0de1b1521@gmail.com>
References: <20181212014130.18634-1-marek.vasut+renesas@gmail.com> <1632836.JPXSTA8kTp@avalon> <904df663-92e1-7891-b897-9cd0de1b1521@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="nextPart1912670.fxPD9czOLF"
Content-Transfer-Encoding: 7Bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This is a multi-part message in MIME format.

--nextPart1912670.fxPD9czOLF
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Marek,

On Thursday, 13 December 2018 04:09:19 EET Marek Vasut wrote:
> On 12/12/2018 09:43 AM, Laurent Pinchart wrote:
> > On Wednesday, 12 December 2018 03:41:30 EET Marek Vasut wrote:
> >> Add simple suspend/resume handlers to the driver to restore the chip
> >> configuration after resume. It is possible that the chip was configured
> >> with non-default values before suspend-resume cycle and that the chip
> >> is powered down during this cycle, so the configuration could get lost.
> >> 
> >> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> >> Cc: Alexey Firago <alexey_firago@mentor.com>
> >> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >> Cc: Michael Turquette <mturquette@baylibre.com>
> >> Cc: Stephen Boyd <sboyd@codeaurora.org>
> >> Cc: linux-renesas-soc@vger.kernel.org
> >> ---
> >> V2: Replace ifdef with __maybe_unused
> >> 
> >>     Simplify return value handling in resume
> >> 
> >> ---
> >> 
> >>  drivers/clk/clk-versaclock5.c | 31 +++++++++++++++++++++++++++++++
> >>  1 file changed, 31 insertions(+)
> >> 
> >> diff --git a/drivers/clk/clk-versaclock5.c
> >> b/drivers/clk/clk-versaclock5.c
> >> index decffb3826ec..b66586a3abb7 100644
> >> --- a/drivers/clk/clk-versaclock5.c
> >> +++ b/drivers/clk/clk-versaclock5.c
> >> @@ -906,6 +906,34 @@ static int vc5_remove(struct i2c_client *client)
> >>  	return 0;
> >>  }
> >> 
> >> +static int __maybe_unused vc5_suspend(struct device *dev)
> >> +{
> >> +	struct vc5_driver_data *vc5 = dev_get_drvdata(dev);
> >> +	int ret;
> >> +
> >> +	ret = regcache_sync(vc5->regmap);
> > 
> > Didn't you say the sync here was unneeded and would be dropped ?
> > 
> >> +	if (ret != 0) {
> >> +		dev_err(dev, "Failed to save register map: %d\n", ret);
> >> +		return ret;
> >> +	}
> 
> If you have a setup with working DU and VGA on something close to next
> (it's broken in next), can you try dropping this hunk (basically do
> ret = 0;//regcache_sync(vc5->regmap); ) and see if the regcache stays
> consistent ? It should. If so, I'll drop this in V3.
> 
> >> +	regcache_cache_only(vc5->regmap, true);
> >> +	regcache_mark_dirty(vc5->regmap);
> 
> [...]

Here's my test procedure:

- Boot the board
- Dump the VC5 state (into vc5-next+*-1-boot.log)
- Enable the VGA output with kmstest -c VGA-1
- Dump the VC5 state (into vc5-next+*-2-display-on.log)
- Suspend and resume
- Dump the VC5 state (into vc5-next+*-3-post-suspend.log)
- Stop kmstest
- Dump the VC5 state (into vc5-next+*-4-display-off.log)

To dump the VC5 state, I use

-----------------------------------------------------------------------------
#!/bin/sh

echo "-------- i2cdump --------"
i2cdump -f -y 4 0x6a

for f in /sys/kernel/debug/regmap/4-006a/* ; do
        echo "-------- $f --------"
        cat $f
done
-----------------------------------------------------------------------------

The base kernel version is v4.20-rc6 + the fixes branch from linux media. I've 
tested the following three configurations, in order:

next+0 - Base
next+1 - Base + this patch
next+2 - Base + this patch + removal of regcache_sync() from vc5_suspend()

With base, the VGA output would remain off after resume, and running kmstest 
again wouldn't help. With the other two configurations the problem is fixed 
and the VGA output is functional.

Furthermore, there are no differences in the VC5 dumps between next+1 and 
next+2, neither are there between the boot and display-on dumps between any of 
the three configurations.

I've attached the logs to this e-mail.

-- 
Regards,

Laurent Pinchart

--nextPart1912670.fxPD9czOLF
Content-Disposition: attachment; filename="vc5-next+0-1-boot.log"
Content-Transfer-Encoding: 7Bit
Content-Type: text/x-log; charset="UTF-8"; name="vc5-next+0-1-boot.log"

-------- i2cdump --------
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f    0123456789abcdef
00: 61 ff 00 00 00 00 00 00 00 ff 01 c0 00 b6 b4 92    a.........??.???
10: 8a 2a 81 80 00 03 84 03 60 00 00 00 1f fd f0 80    ?*??.???`...????
20: 00 81 00 5d 17 44 00 00 00 00 04 00 00 00 90 00    .?.]?D....?...?.
30: 00 81 02 00 00 00 00 00 00 00 04 00 00 00 c0 00    .??.......?...?.
40: 00 00 00 00 00 00 00 00 00 00 04 00 00 00 00 00    ..........?.....
50: 00 00 00 00 00 00 00 00 00 00 04 00 00 00 00 00    ..........?.....
60: 23 01 23 01 23 00 23 00 fc e4 00 00 00 00 00 30    #?#?#.#.??.....0
70: 00 60 f0 00 4e 00 63 00 00 10 02 08 6e 05 14 02    .`?.N.c..???n???
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
90: 00 00 00 00 00 00 00 00 00 56 00 00 00 90 94 b4    .........V...???
a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
-------- /sys/kernel/debug/regmap/4-006a/access --------
00: y n n n
01: y n n n
02: y n n n
03: y n n n
04: y n n n
05: y n n n
06: y n n n
07: y n n n
08: y n n n
09: y n n n
0a: y n n n
0b: y n n n
0c: y n n n
0d: y n n n
0e: y n n n
0f: y n n n
10: y y n n
11: y y n n
12: y y n n
13: y y n n
14: y n n n
15: y y n n
16: y y n n
17: y y n n
18: y y n n
19: y y n n
1a: y y n n
1b: y y n n
1c: y n n n
1d: y n n n
1e: y y n n
1f: y y n n
20: y y n n
21: y y n n
22: y y n n
23: y y n n
24: y y n n
25: y y n n
26: y y n n
27: y y n n
28: y y n n
29: y y n n
2a: y y n n
2b: y y n n
2c: y y n n
2d: y y n n
2e: y y n n
2f: y y n n
30: y y n n
31: y y n n
32: y y n n
33: y y n n
34: y y n n
35: y y n n
36: y y n n
37: y y n n
38: y y n n
39: y y n n
3a: y y n n
3b: y y n n
3c: y y n n
3d: y y n n
3e: y y n n
3f: y y n n
40: y y n n
41: y y n n
42: y y n n
43: y y n n
44: y y n n
45: y y n n
46: y y n n
47: y y n n
48: y y n n
49: y y n n
4a: y y n n
4b: y y n n
4c: y y n n
4d: y y n n
4e: y y n n
4f: y y n n
50: y y n n
51: y y n n
52: y y n n
53: y y n n
54: y y n n
55: y y n n
56: y y n n
57: y y n n
58: y y n n
59: y y n n
5a: y y n n
5b: y y n n
5c: y y n n
5d: y y n n
5e: y y n n
5f: y y n n
60: y y n n
61: y y n n
62: y y n n
63: y y n n
64: y y n n
65: y y n n
66: y y n n
67: y y n n
68: y y n n
69: y y n n
6a: y y n n
6b: y y n n
6c: y y n n
6d: y y n n
6e: y y n n
6f: y y n n
70: y y n n
71: y y n n
72: y y n n
73: y y n n
74: y y n n
75: y y n n
76: y y n n
-------- /sys/kernel/debug/regmap/4-006a/cache_bypass --------
N
-------- /sys/kernel/debug/regmap/4-006a/cache_dirty --------
N
-------- /sys/kernel/debug/regmap/4-006a/cache_only --------
N
-------- /sys/kernel/debug/regmap/4-006a/name --------
vc5
-------- /sys/kernel/debug/regmap/4-006a/range --------
0-76
-------- /sys/kernel/debug/regmap/4-006a/rbtree --------
10-5e (79)
1 nodes, 79 registers, average 79 registers, used 159 bytes
-------- /sys/kernel/debug/regmap/4-006a/registers --------
00: 61
01: ff
02: 00
03: 00
04: 00
05: 00
06: 00
07: 00
08: 00
09: ff
0a: 01
0b: c0
0c: 00
0d: b6
0e: b4
0f: 92
10: 8a
11: 2a
12: 81
13: 80
14: 00
15: 03
16: 84
17: 03
18: 60
19: 00
1a: 00
1b: 00
1c: 1f
1d: fd
1e: f0
1f: 80
20: 00
21: 81
22: 00
23: 5d
24: 17
25: 44
26: 00
27: 00
28: 00
29: 00
2a: 04
2b: 00
2c: 00
2d: 00
2e: 90
2f: 00
30: 00
31: 81
32: 02
33: 00
34: 00
35: 00
36: 00
37: 00
38: 00
39: 00
3a: 04
3b: 00
3c: 00
3d: 00
3e: c0
3f: 00
40: 00
41: 00
42: 00
43: 00
44: 00
45: 00
46: 00
47: 00
48: 00
49: 00
4a: 04
4b: 00
4c: 00
4d: 00
4e: 00
4f: 00
50: 00
51: 00
52: 00
53: 00
54: 00
55: 00
56: 00
57: 00
58: 00
59: 00
5a: 04
5b: 00
5c: 00
5d: 00
5e: 00
5f: 00
60: 23
61: 01
62: 23
63: 01
64: 23
65: 00
66: 23
67: 00
68: fc
69: e4
6a: 00
6b: 00
6c: 00
6d: 00
6e: 00
6f: 30
70: 00
71: 60
72: f0
73: 00
74: 4e
75: 00
76: 63

--nextPart1912670.fxPD9czOLF
Content-Disposition: attachment; filename="vc5-next+0-2-display-on.log"
Content-Transfer-Encoding: 7Bit
Content-Type: text/x-log; charset="UTF-8"; name="vc5-next+0-2-display-on.log"

-------- i2cdump --------
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f    0123456789abcdef
00: 61 ff 00 00 00 00 00 00 00 ff 01 c0 00 b6 b4 92    a.........??.???
10: 8a 2a 81 80 00 03 84 03 60 00 00 00 1f fd f0 80    ?*??.???`...????
20: 00 81 00 5d 17 44 00 00 00 00 04 00 00 00 90 00    .?.]?D....?...?.
30: 00 81 03 13 b1 38 00 00 00 00 00 00 00 01 40 00    .????8.......?@.
40: 00 00 00 00 00 00 00 00 00 00 04 00 00 00 00 00    ..........?.....
50: 00 00 00 00 00 00 00 00 00 00 04 00 00 00 00 00    ..........?.....
60: 23 01 23 01 23 00 23 00 fc e4 00 00 00 00 00 30    #?#?#.#.??.....0
70: 00 60 f0 00 4e 00 63 00 00 10 02 08 6e 05 14 02    .`?.N.c..???n???
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
90: 00 00 00 00 00 00 00 00 00 56 00 00 00 90 94 b4    .........V...???
a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
-------- /sys/kernel/debug/regmap/4-006a/access --------
00: y n n n
01: y n n n
02: y n n n
03: y n n n
04: y n n n
05: y n n n
06: y n n n
07: y n n n
08: y n n n
09: y n n n
0a: y n n n
0b: y n n n
0c: y n n n
0d: y n n n
0e: y n n n
0f: y n n n
10: y y n n
11: y y n n
12: y y n n
13: y y n n
14: y n n n
15: y y n n
16: y y n n
17: y y n n
18: y y n n
19: y y n n
1a: y y n n
1b: y y n n
1c: y n n n
1d: y n n n
1e: y y n n
1f: y y n n
20: y y n n
21: y y n n
22: y y n n
23: y y n n
24: y y n n
25: y y n n
26: y y n n
27: y y n n
28: y y n n
29: y y n n
2a: y y n n
2b: y y n n
2c: y y n n
2d: y y n n
2e: y y n n
2f: y y n n
30: y y n n
31: y y n n
32: y y n n
33: y y n n
34: y y n n
35: y y n n
36: y y n n
37: y y n n
38: y y n n
39: y y n n
3a: y y n n
3b: y y n n
3c: y y n n
3d: y y n n
3e: y y n n
3f: y y n n
40: y y n n
41: y y n n
42: y y n n
43: y y n n
44: y y n n
45: y y n n
46: y y n n
47: y y n n
48: y y n n
49: y y n n
4a: y y n n
4b: y y n n
4c: y y n n
4d: y y n n
4e: y y n n
4f: y y n n
50: y y n n
51: y y n n
52: y y n n
53: y y n n
54: y y n n
55: y y n n
56: y y n n
57: y y n n
58: y y n n
59: y y n n
5a: y y n n
5b: y y n n
5c: y y n n
5d: y y n n
5e: y y n n
5f: y y n n
60: y y n n
61: y y n n
62: y y n n
63: y y n n
64: y y n n
65: y y n n
66: y y n n
67: y y n n
68: y y n n
69: y y n n
6a: y y n n
6b: y y n n
6c: y y n n
6d: y y n n
6e: y y n n
6f: y y n n
70: y y n n
71: y y n n
72: y y n n
73: y y n n
74: y y n n
75: y y n n
76: y y n n
-------- /sys/kernel/debug/regmap/4-006a/cache_bypass --------
N
-------- /sys/kernel/debug/regmap/4-006a/cache_dirty --------
N
-------- /sys/kernel/debug/regmap/4-006a/cache_only --------
N
-------- /sys/kernel/debug/regmap/4-006a/name --------
vc5
-------- /sys/kernel/debug/regmap/4-006a/range --------
0-76
-------- /sys/kernel/debug/regmap/4-006a/rbtree --------
0-76 (119)
1 nodes, 119 registers, average 119 registers, used 199 bytes
-------- /sys/kernel/debug/regmap/4-006a/registers --------
00: 61
01: ff
02: 00
03: 00
04: 00
05: 00
06: 00
07: 00
08: 00
09: ff
0a: 01
0b: c0
0c: 00
0d: b6
0e: b4
0f: 92
10: 8a
11: 2a
12: 81
13: 80
14: 00
15: 03
16: 84
17: 03
18: 60
19: 00
1a: 00
1b: 00
1c: 1f
1d: fd
1e: f0
1f: 80
20: 00
21: 81
22: 00
23: 5d
24: 17
25: 44
26: 00
27: 00
28: 00
29: 00
2a: 04
2b: 00
2c: 00
2d: 00
2e: 90
2f: 00
30: 00
31: 81
32: 03
33: 13
34: b1
35: 38
36: 00
37: 00
38: 00
39: 00
3a: 00
3b: 00
3c: 00
3d: 01
3e: 40
3f: 00
40: 00
41: 00
42: 00
43: 00
44: 00
45: 00
46: 00
47: 00
48: 00
49: 00
4a: 04
4b: 00
4c: 00
4d: 00
4e: 00
4f: 00
50: 00
51: 00
52: 00
53: 00
54: 00
55: 00
56: 00
57: 00
58: 00
59: 00
5a: 04
5b: 00
5c: 00
5d: 00
5e: 00
5f: 00
60: 23
61: 01
62: 23
63: 01
64: 23
65: 00
66: 23
67: 00
68: fc
69: e4
6a: 00
6b: 00
6c: 00
6d: 00
6e: 00
6f: 30
70: 00
71: 60
72: f0
73: 00
74: 4e
75: 00
76: 63

--nextPart1912670.fxPD9czOLF
Content-Disposition: attachment; filename="vc5-next+0-3-post-suspend.log"
Content-Transfer-Encoding: 7Bit
Content-Type: text/x-log; charset="UTF-8"; name="vc5-next+0-3-post-suspend.log"

-------- i2cdump --------
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f    0123456789abcdef
00: 61 ff 00 00 00 00 00 00 00 ff 01 c0 00 b6 b4 92    a.........??.???
10: 8a 2a 81 80 00 03 84 03 60 00 00 00 1f fd f0 80    ?*??.???`...????
20: 00 81 00 5d 17 44 00 00 00 00 04 00 00 00 90 00    .?.]?D....?...?.
30: 00 81 02 00 00 00 00 00 00 00 04 00 00 00 c0 00    .??.......?...?.
40: 00 00 00 00 00 00 00 00 00 00 04 00 00 00 00 00    ..........?.....
50: 00 00 00 00 00 00 00 00 00 00 04 00 00 00 00 00    ..........?.....
60: 23 01 23 01 23 00 23 00 fc e4 00 00 00 00 00 30    #?#?#.#.??.....0
70: 00 60 f0 00 4e 00 63 00 00 10 02 08 6e 05 14 02    .`?.N.c..???n???
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
90: 00 00 00 00 00 00 00 00 00 56 00 00 00 90 94 b4    .........V...???
a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
-------- /sys/kernel/debug/regmap/4-006a/access --------
00: y n n n
01: y n n n
02: y n n n
03: y n n n
04: y n n n
05: y n n n
06: y n n n
07: y n n n
08: y n n n
09: y n n n
0a: y n n n
0b: y n n n
0c: y n n n
0d: y n n n
0e: y n n n
0f: y n n n
10: y y n n
11: y y n n
12: y y n n
13: y y n n
14: y n n n
15: y y n n
16: y y n n
17: y y n n
18: y y n n
19: y y n n
1a: y y n n
1b: y y n n
1c: y n n n
1d: y n n n
1e: y y n n
1f: y y n n
20: y y n n
21: y y n n
22: y y n n
23: y y n n
24: y y n n
25: y y n n
26: y y n n
27: y y n n
28: y y n n
29: y y n n
2a: y y n n
2b: y y n n
2c: y y n n
2d: y y n n
2e: y y n n
2f: y y n n
30: y y n n
31: y y n n
32: y y n n
33: y y n n
34: y y n n
35: y y n n
36: y y n n
37: y y n n
38: y y n n
39: y y n n
3a: y y n n
3b: y y n n
3c: y y n n
3d: y y n n
3e: y y n n
3f: y y n n
40: y y n n
41: y y n n
42: y y n n
43: y y n n
44: y y n n
45: y y n n
46: y y n n
47: y y n n
48: y y n n
49: y y n n
4a: y y n n
4b: y y n n
4c: y y n n
4d: y y n n
4e: y y n n
4f: y y n n
50: y y n n
51: y y n n
52: y y n n
53: y y n n
54: y y n n
55: y y n n
56: y y n n
57: y y n n
58: y y n n
59: y y n n
5a: y y n n
5b: y y n n
5c: y y n n
5d: y y n n
5e: y y n n
5f: y y n n
60: y y n n
61: y y n n
62: y y n n
63: y y n n
64: y y n n
65: y y n n
66: y y n n
67: y y n n
68: y y n n
69: y y n n
6a: y y n n
6b: y y n n
6c: y y n n
6d: y y n n
6e: y y n n
6f: y y n n
70: y y n n
71: y y n n
72: y y n n
73: y y n n
74: y y n n
75: y y n n
76: y y n n
-------- /sys/kernel/debug/regmap/4-006a/cache_bypass --------
N
-------- /sys/kernel/debug/regmap/4-006a/cache_dirty --------
N
-------- /sys/kernel/debug/regmap/4-006a/cache_only --------
N
-------- /sys/kernel/debug/regmap/4-006a/name --------
vc5
-------- /sys/kernel/debug/regmap/4-006a/range --------
0-76
-------- /sys/kernel/debug/regmap/4-006a/rbtree --------
0-76 (119)
1 nodes, 119 registers, average 119 registers, used 199 bytes
-------- /sys/kernel/debug/regmap/4-006a/registers --------
00: 61
01: ff
02: 00
03: 00
04: 00
05: 00
06: 00
07: 00
08: 00
09: ff
0a: 01
0b: c0
0c: 00
0d: b6
0e: b4
0f: 92
10: 8a
11: 2a
12: 81
13: 80
14: 00
15: 03
16: 84
17: 03
18: 60
19: 00
1a: 00
1b: 00
1c: 1f
1d: fd
1e: f0
1f: 80
20: 00
21: 81
22: 00
23: 5d
24: 17
25: 44
26: 00
27: 00
28: 00
29: 00
2a: 04
2b: 00
2c: 00
2d: 00
2e: 90
2f: 00
30: 00
31: 81
32: 03
33: 13
34: b1
35: 38
36: 00
37: 00
38: 00
39: 00
3a: 00
3b: 00
3c: 00
3d: 01
3e: 40
3f: 00
40: 00
41: 00
42: 00
43: 00
44: 00
45: 00
46: 00
47: 00
48: 00
49: 00
4a: 04
4b: 00
4c: 00
4d: 00
4e: 00
4f: 00
50: 00
51: 00
52: 00
53: 00
54: 00
55: 00
56: 00
57: 00
58: 00
59: 00
5a: 04
5b: 00
5c: 00
5d: 00
5e: 00
5f: 00
60: 23
61: 01
62: 23
63: 01
64: 23
65: 00
66: 23
67: 00
68: fc
69: e4
6a: 00
6b: 00
6c: 00
6d: 00
6e: 00
6f: 30
70: 00
71: 60
72: f0
73: 00
74: 4e
75: 00
76: 63

--nextPart1912670.fxPD9czOLF
Content-Disposition: attachment; filename="vc5-next+0-4-display-off.log"
Content-Transfer-Encoding: 7Bit
Content-Type: text/x-log; charset="UTF-8"; name="vc5-next+0-4-display-off.log"

-------- i2cdump --------
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f    0123456789abcdef
00: 61 ff 00 00 00 00 00 00 00 ff 01 c0 00 b6 b4 92    a.........??.???
10: 8a 2a 81 80 00 03 84 03 60 00 00 00 1f fd f0 80    ?*??.???`...????
20: 00 81 00 5d 17 44 00 00 00 00 04 00 00 00 90 00    .?.]?D....?...?.
30: 00 81 02 00 00 00 00 00 00 00 04 00 00 00 c0 00    .??.......?...?.
40: 00 00 00 00 00 00 00 00 00 00 04 00 00 00 00 00    ..........?.....
50: 00 00 00 00 00 00 00 00 00 00 04 00 00 00 00 00    ..........?.....
60: 23 01 23 01 23 00 23 00 fc e4 00 00 00 00 00 30    #?#?#.#.??.....0
70: 00 60 f0 00 4e 00 63 00 00 10 02 08 6e 05 14 02    .`?.N.c..???n???
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
90: 00 00 00 00 00 00 00 00 00 56 00 00 00 90 94 b4    .........V...???
a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
-------- /sys/kernel/debug/regmap/4-006a/access --------
00: y n n n
01: y n n n
02: y n n n
03: y n n n
04: y n n n
05: y n n n
06: y n n n
07: y n n n
08: y n n n
09: y n n n
0a: y n n n
0b: y n n n
0c: y n n n
0d: y n n n
0e: y n n n
0f: y n n n
10: y y n n
11: y y n n
12: y y n n
13: y y n n
14: y n n n
15: y y n n
16: y y n n
17: y y n n
18: y y n n
19: y y n n
1a: y y n n
1b: y y n n
1c: y n n n
1d: y n n n
1e: y y n n
1f: y y n n
20: y y n n
21: y y n n
22: y y n n
23: y y n n
24: y y n n
25: y y n n
26: y y n n
27: y y n n
28: y y n n
29: y y n n
2a: y y n n
2b: y y n n
2c: y y n n
2d: y y n n
2e: y y n n
2f: y y n n
30: y y n n
31: y y n n
32: y y n n
33: y y n n
34: y y n n
35: y y n n
36: y y n n
37: y y n n
38: y y n n
39: y y n n
3a: y y n n
3b: y y n n
3c: y y n n
3d: y y n n
3e: y y n n
3f: y y n n
40: y y n n
41: y y n n
42: y y n n
43: y y n n
44: y y n n
45: y y n n
46: y y n n
47: y y n n
48: y y n n
49: y y n n
4a: y y n n
4b: y y n n
4c: y y n n
4d: y y n n
4e: y y n n
4f: y y n n
50: y y n n
51: y y n n
52: y y n n
53: y y n n
54: y y n n
55: y y n n
56: y y n n
57: y y n n
58: y y n n
59: y y n n
5a: y y n n
5b: y y n n
5c: y y n n
5d: y y n n
5e: y y n n
5f: y y n n
60: y y n n
61: y y n n
62: y y n n
63: y y n n
64: y y n n
65: y y n n
66: y y n n
67: y y n n
68: y y n n
69: y y n n
6a: y y n n
6b: y y n n
6c: y y n n
6d: y y n n
6e: y y n n
6f: y y n n
70: y y n n
71: y y n n
72: y y n n
73: y y n n
74: y y n n
75: y y n n
76: y y n n
-------- /sys/kernel/debug/regmap/4-006a/cache_bypass --------
N
-------- /sys/kernel/debug/regmap/4-006a/cache_dirty --------
N
-------- /sys/kernel/debug/regmap/4-006a/cache_only --------
N
-------- /sys/kernel/debug/regmap/4-006a/name --------
vc5
-------- /sys/kernel/debug/regmap/4-006a/range --------
0-76
-------- /sys/kernel/debug/regmap/4-006a/rbtree --------
0-76 (119)
1 nodes, 119 registers, average 119 registers, used 199 bytes
-------- /sys/kernel/debug/regmap/4-006a/registers --------
00: 61
01: ff
02: 00
03: 00
04: 00
05: 00
06: 00
07: 00
08: 00
09: ff
0a: 01
0b: c0
0c: 00
0d: b6
0e: b4
0f: 92
10: 8a
11: 2a
12: 81
13: 80
14: 00
15: 03
16: 84
17: 03
18: 60
19: 00
1a: 00
1b: 00
1c: 1f
1d: fd
1e: f0
1f: 80
20: 00
21: 81
22: 00
23: 5d
24: 17
25: 44
26: 00
27: 00
28: 00
29: 00
2a: 04
2b: 00
2c: 00
2d: 00
2e: 90
2f: 00
30: 00
31: 81
32: 03
33: 13
34: b1
35: 38
36: 00
37: 00
38: 00
39: 00
3a: 00
3b: 00
3c: 00
3d: 01
3e: 40
3f: 00
40: 00
41: 00
42: 00
43: 00
44: 00
45: 00
46: 00
47: 00
48: 00
49: 00
4a: 04
4b: 00
4c: 00
4d: 00
4e: 00
4f: 00
50: 00
51: 00
52: 00
53: 00
54: 00
55: 00
56: 00
57: 00
58: 00
59: 00
5a: 04
5b: 00
5c: 00
5d: 00
5e: 00
5f: 00
60: 23
61: 01
62: 23
63: 01
64: 23
65: 00
66: 23
67: 00
68: fc
69: e4
6a: 00
6b: 00
6c: 00
6d: 00
6e: 00
6f: 30
70: 00
71: 60
72: f0
73: 00
74: 4e
75: 00
76: 63

--nextPart1912670.fxPD9czOLF
Content-Disposition: attachment; filename="vc5-next+1-2-display-on.log"
Content-Transfer-Encoding: 7Bit
Content-Type: text/x-log; charset="UTF-8"; name="vc5-next+1-2-display-on.log"

-------- i2cdump --------
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f    0123456789abcdef
00: 61 ff 00 00 00 00 00 00 00 ff 01 c0 00 b6 b4 92    a.........??.???
10: 8a 2a 81 80 00 03 84 03 60 00 00 00 1f fd f0 80    ?*??.???`...????
20: 00 81 00 5d 17 44 00 00 00 00 04 00 00 00 90 00    .?.]?D....?...?.
30: 00 81 03 13 b1 38 00 00 00 00 00 00 00 01 40 00    .????8.......?@.
40: 00 00 00 00 00 00 00 00 00 00 04 00 00 00 00 00    ..........?.....
50: 00 00 00 00 00 00 00 00 00 00 04 00 00 00 00 00    ..........?.....
60: 23 01 23 01 23 00 23 00 fc e4 00 00 00 00 00 30    #?#?#.#.??.....0
70: 00 60 f0 00 4e 00 63 00 00 10 02 08 6e 05 14 02    .`?.N.c..???n???
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
90: 00 00 00 00 00 00 00 00 00 56 00 00 00 90 94 b4    .........V...???
a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
-------- /sys/kernel/debug/regmap/4-006a/access --------
00: y n n n
01: y n n n
02: y n n n
03: y n n n
04: y n n n
05: y n n n
06: y n n n
07: y n n n
08: y n n n
09: y n n n
0a: y n n n
0b: y n n n
0c: y n n n
0d: y n n n
0e: y n n n
0f: y n n n
10: y y n n
11: y y n n
12: y y n n
13: y y n n
14: y n n n
15: y y n n
16: y y n n
17: y y n n
18: y y n n
19: y y n n
1a: y y n n
1b: y y n n
1c: y n n n
1d: y n n n
1e: y y n n
1f: y y n n
20: y y n n
21: y y n n
22: y y n n
23: y y n n
24: y y n n
25: y y n n
26: y y n n
27: y y n n
28: y y n n
29: y y n n
2a: y y n n
2b: y y n n
2c: y y n n
2d: y y n n
2e: y y n n
2f: y y n n
30: y y n n
31: y y n n
32: y y n n
33: y y n n
34: y y n n
35: y y n n
36: y y n n
37: y y n n
38: y y n n
39: y y n n
3a: y y n n
3b: y y n n
3c: y y n n
3d: y y n n
3e: y y n n
3f: y y n n
40: y y n n
41: y y n n
42: y y n n
43: y y n n
44: y y n n
45: y y n n
46: y y n n
47: y y n n
48: y y n n
49: y y n n
4a: y y n n
4b: y y n n
4c: y y n n
4d: y y n n
4e: y y n n
4f: y y n n
50: y y n n
51: y y n n
52: y y n n
53: y y n n
54: y y n n
55: y y n n
56: y y n n
57: y y n n
58: y y n n
59: y y n n
5a: y y n n
5b: y y n n
5c: y y n n
5d: y y n n
5e: y y n n
5f: y y n n
60: y y n n
61: y y n n
62: y y n n
63: y y n n
64: y y n n
65: y y n n
66: y y n n
67: y y n n
68: y y n n
69: y y n n
6a: y y n n
6b: y y n n
6c: y y n n
6d: y y n n
6e: y y n n
6f: y y n n
70: y y n n
71: y y n n
72: y y n n
73: y y n n
74: y y n n
75: y y n n
76: y y n n
-------- /sys/kernel/debug/regmap/4-006a/cache_bypass --------
N
-------- /sys/kernel/debug/regmap/4-006a/cache_dirty --------
N
-------- /sys/kernel/debug/regmap/4-006a/cache_only --------
N
-------- /sys/kernel/debug/regmap/4-006a/name --------
vc5
-------- /sys/kernel/debug/regmap/4-006a/range --------
0-76
-------- /sys/kernel/debug/regmap/4-006a/rbtree --------
0-76 (119)
1 nodes, 119 registers, average 119 registers, used 199 bytes
-------- /sys/kernel/debug/regmap/4-006a/registers --------
00: 61
01: ff
02: 00
03: 00
04: 00
05: 00
06: 00
07: 00
08: 00
09: ff
0a: 01
0b: c0
0c: 00
0d: b6
0e: b4
0f: 92
10: 8a
11: 2a
12: 81
13: 80
14: 00
15: 03
16: 84
17: 03
18: 60
19: 00
1a: 00
1b: 00
1c: 1f
1d: fd
1e: f0
1f: 80
20: 00
21: 81
22: 00
23: 5d
24: 17
25: 44
26: 00
27: 00
28: 00
29: 00
2a: 04
2b: 00
2c: 00
2d: 00
2e: 90
2f: 00
30: 00
31: 81
32: 03
33: 13
34: b1
35: 38
36: 00
37: 00
38: 00
39: 00
3a: 00
3b: 00
3c: 00
3d: 01
3e: 40
3f: 00
40: 00
41: 00
42: 00
43: 00
44: 00
45: 00
46: 00
47: 00
48: 00
49: 00
4a: 04
4b: 00
4c: 00
4d: 00
4e: 00
4f: 00
50: 00
51: 00
52: 00
53: 00
54: 00
55: 00
56: 00
57: 00
58: 00
59: 00
5a: 04
5b: 00
5c: 00
5d: 00
5e: 00
5f: 00
60: 23
61: 01
62: 23
63: 01
64: 23
65: 00
66: 23
67: 00
68: fc
69: e4
6a: 00
6b: 00
6c: 00
6d: 00
6e: 00
6f: 30
70: 00
71: 60
72: f0
73: 00
74: 4e
75: 00
76: 63

--nextPart1912670.fxPD9czOLF
Content-Disposition: attachment; filename="vc5-next+1-1-boot.log"
Content-Transfer-Encoding: 7Bit
Content-Type: text/x-log; charset="UTF-8"; name="vc5-next+1-1-boot.log"

-------- i2cdump --------
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f    0123456789abcdef
00: 61 ff 00 00 00 00 00 00 00 ff 01 c0 00 b6 b4 92    a.........??.???
10: 8a 2a 81 80 00 03 84 03 60 00 00 00 1f fd f0 80    ?*??.???`...????
20: 00 81 00 5d 17 44 00 00 00 00 04 00 00 00 90 00    .?.]?D....?...?.
30: 00 81 02 00 00 00 00 00 00 00 04 00 00 00 c0 00    .??.......?...?.
40: 00 00 00 00 00 00 00 00 00 00 04 00 00 00 00 00    ..........?.....
50: 00 00 00 00 00 00 00 00 00 00 04 00 00 00 00 00    ..........?.....
60: 23 01 23 01 23 00 23 00 fc e4 00 00 00 00 00 30    #?#?#.#.??.....0
70: 00 60 f0 00 4e 00 63 00 00 10 02 08 6e 05 14 02    .`?.N.c..???n???
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
90: 00 00 00 00 00 00 00 00 00 56 00 00 00 90 94 b4    .........V...???
a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
-------- /sys/kernel/debug/regmap/4-006a/access --------
00: y n n n
01: y n n n
02: y n n n
03: y n n n
04: y n n n
05: y n n n
06: y n n n
07: y n n n
08: y n n n
09: y n n n
0a: y n n n
0b: y n n n
0c: y n n n
0d: y n n n
0e: y n n n
0f: y n n n
10: y y n n
11: y y n n
12: y y n n
13: y y n n
14: y n n n
15: y y n n
16: y y n n
17: y y n n
18: y y n n
19: y y n n
1a: y y n n
1b: y y n n
1c: y n n n
1d: y n n n
1e: y y n n
1f: y y n n
20: y y n n
21: y y n n
22: y y n n
23: y y n n
24: y y n n
25: y y n n
26: y y n n
27: y y n n
28: y y n n
29: y y n n
2a: y y n n
2b: y y n n
2c: y y n n
2d: y y n n
2e: y y n n
2f: y y n n
30: y y n n
31: y y n n
32: y y n n
33: y y n n
34: y y n n
35: y y n n
36: y y n n
37: y y n n
38: y y n n
39: y y n n
3a: y y n n
3b: y y n n
3c: y y n n
3d: y y n n
3e: y y n n
3f: y y n n
40: y y n n
41: y y n n
42: y y n n
43: y y n n
44: y y n n
45: y y n n
46: y y n n
47: y y n n
48: y y n n
49: y y n n
4a: y y n n
4b: y y n n
4c: y y n n
4d: y y n n
4e: y y n n
4f: y y n n
50: y y n n
51: y y n n
52: y y n n
53: y y n n
54: y y n n
55: y y n n
56: y y n n
57: y y n n
58: y y n n
59: y y n n
5a: y y n n
5b: y y n n
5c: y y n n
5d: y y n n
5e: y y n n
5f: y y n n
60: y y n n
61: y y n n
62: y y n n
63: y y n n
64: y y n n
65: y y n n
66: y y n n
67: y y n n
68: y y n n
69: y y n n
6a: y y n n
6b: y y n n
6c: y y n n
6d: y y n n
6e: y y n n
6f: y y n n
70: y y n n
71: y y n n
72: y y n n
73: y y n n
74: y y n n
75: y y n n
76: y y n n
-------- /sys/kernel/debug/regmap/4-006a/cache_bypass --------
N
-------- /sys/kernel/debug/regmap/4-006a/cache_dirty --------
N
-------- /sys/kernel/debug/regmap/4-006a/cache_only --------
N
-------- /sys/kernel/debug/regmap/4-006a/name --------
vc5
-------- /sys/kernel/debug/regmap/4-006a/range --------
0-76
-------- /sys/kernel/debug/regmap/4-006a/rbtree --------
10-5e (79)
1 nodes, 79 registers, average 79 registers, used 159 bytes
-------- /sys/kernel/debug/regmap/4-006a/registers --------
00: 61
01: ff
02: 00
03: 00
04: 00
05: 00
06: 00
07: 00
08: 00
09: ff
0a: 01
0b: c0
0c: 00
0d: b6
0e: b4
0f: 92
10: 8a
11: 2a
12: 81
13: 80
14: 00
15: 03
16: 84
17: 03
18: 60
19: 00
1a: 00
1b: 00
1c: 1f
1d: fd
1e: f0
1f: 80
20: 00
21: 81
22: 00
23: 5d
24: 17
25: 44
26: 00
27: 00
28: 00
29: 00
2a: 04
2b: 00
2c: 00
2d: 00
2e: 90
2f: 00
30: 00
31: 81
32: 02
33: 00
34: 00
35: 00
36: 00
37: 00
38: 00
39: 00
3a: 04
3b: 00
3c: 00
3d: 00
3e: c0
3f: 00
40: 00
41: 00
42: 00
43: 00
44: 00
45: 00
46: 00
47: 00
48: 00
49: 00
4a: 04
4b: 00
4c: 00
4d: 00
4e: 00
4f: 00
50: 00
51: 00
52: 00
53: 00
54: 00
55: 00
56: 00
57: 00
58: 00
59: 00
5a: 04
5b: 00
5c: 00
5d: 00
5e: 00
5f: 00
60: 23
61: 01
62: 23
63: 01
64: 23
65: 00
66: 23
67: 00
68: fc
69: e4
6a: 00
6b: 00
6c: 00
6d: 00
6e: 00
6f: 30
70: 00
71: 60
72: f0
73: 00
74: 4e
75: 00
76: 63

--nextPart1912670.fxPD9czOLF
Content-Disposition: attachment; filename="vc5-next+1-3-post-suspend.log"
Content-Transfer-Encoding: 7Bit
Content-Type: text/x-log; charset="UTF-8"; name="vc5-next+1-3-post-suspend.log"

-------- i2cdump --------
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f    0123456789abcdef
00: 61 ff 00 00 00 00 00 00 00 ff 01 c0 00 b6 b4 92    a.........??.???
10: 8a 2a 81 80 00 03 84 03 60 00 00 00 1f fd f0 80    ?*??.???`...????
20: 00 81 00 5d 17 44 00 00 00 00 04 00 00 00 90 00    .?.]?D....?...?.
30: 00 81 03 13 b1 38 00 00 00 00 00 00 00 01 40 00    .????8.......?@.
40: 00 00 00 00 00 00 00 00 00 00 04 00 00 00 00 00    ..........?.....
50: 00 00 00 00 00 00 00 00 00 00 04 00 00 00 00 00    ..........?.....
60: 23 01 23 01 23 00 23 00 fc e4 00 00 00 00 00 30    #?#?#.#.??.....0
70: 00 60 f0 00 4e 00 63 00 00 10 02 08 6e 05 14 02    .`?.N.c..???n???
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
90: 00 00 00 00 00 00 00 00 00 56 00 00 00 90 94 b4    .........V...???
a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
-------- /sys/kernel/debug/regmap/4-006a/access --------
00: y n n n
01: y n n n
02: y n n n
03: y n n n
04: y n n n
05: y n n n
06: y n n n
07: y n n n
08: y n n n
09: y n n n
0a: y n n n
0b: y n n n
0c: y n n n
0d: y n n n
0e: y n n n
0f: y n n n
10: y y n n
11: y y n n
12: y y n n
13: y y n n
14: y n n n
15: y y n n
16: y y n n
17: y y n n
18: y y n n
19: y y n n
1a: y y n n
1b: y y n n
1c: y n n n
1d: y n n n
1e: y y n n
1f: y y n n
20: y y n n
21: y y n n
22: y y n n
23: y y n n
24: y y n n
25: y y n n
26: y y n n
27: y y n n
28: y y n n
29: y y n n
2a: y y n n
2b: y y n n
2c: y y n n
2d: y y n n
2e: y y n n
2f: y y n n
30: y y n n
31: y y n n
32: y y n n
33: y y n n
34: y y n n
35: y y n n
36: y y n n
37: y y n n
38: y y n n
39: y y n n
3a: y y n n
3b: y y n n
3c: y y n n
3d: y y n n
3e: y y n n
3f: y y n n
40: y y n n
41: y y n n
42: y y n n
43: y y n n
44: y y n n
45: y y n n
46: y y n n
47: y y n n
48: y y n n
49: y y n n
4a: y y n n
4b: y y n n
4c: y y n n
4d: y y n n
4e: y y n n
4f: y y n n
50: y y n n
51: y y n n
52: y y n n
53: y y n n
54: y y n n
55: y y n n
56: y y n n
57: y y n n
58: y y n n
59: y y n n
5a: y y n n
5b: y y n n
5c: y y n n
5d: y y n n
5e: y y n n
5f: y y n n
60: y y n n
61: y y n n
62: y y n n
63: y y n n
64: y y n n
65: y y n n
66: y y n n
67: y y n n
68: y y n n
69: y y n n
6a: y y n n
6b: y y n n
6c: y y n n
6d: y y n n
6e: y y n n
6f: y y n n
70: y y n n
71: y y n n
72: y y n n
73: y y n n
74: y y n n
75: y y n n
76: y y n n
-------- /sys/kernel/debug/regmap/4-006a/cache_bypass --------
N
-------- /sys/kernel/debug/regmap/4-006a/cache_dirty --------
N
-------- /sys/kernel/debug/regmap/4-006a/cache_only --------
N
-------- /sys/kernel/debug/regmap/4-006a/name --------
vc5
-------- /sys/kernel/debug/regmap/4-006a/range --------
0-76
-------- /sys/kernel/debug/regmap/4-006a/rbtree --------
0-76 (119)
1 nodes, 119 registers, average 119 registers, used 199 bytes
-------- /sys/kernel/debug/regmap/4-006a/registers --------
00: 61
01: ff
02: 00
03: 00
04: 00
05: 00
06: 00
07: 00
08: 00
09: ff
0a: 01
0b: c0
0c: 00
0d: b6
0e: b4
0f: 92
10: 8a
11: 2a
12: 81
13: 80
14: 00
15: 03
16: 84
17: 03
18: 60
19: 00
1a: 00
1b: 00
1c: 1f
1d: fd
1e: f0
1f: 80
20: 00
21: 81
22: 00
23: 5d
24: 17
25: 44
26: 00
27: 00
28: 00
29: 00
2a: 04
2b: 00
2c: 00
2d: 00
2e: 90
2f: 00
30: 00
31: 81
32: 03
33: 13
34: b1
35: 38
36: 00
37: 00
38: 00
39: 00
3a: 00
3b: 00
3c: 00
3d: 01
3e: 40
3f: 00
40: 00
41: 00
42: 00
43: 00
44: 00
45: 00
46: 00
47: 00
48: 00
49: 00
4a: 04
4b: 00
4c: 00
4d: 00
4e: 00
4f: 00
50: 00
51: 00
52: 00
53: 00
54: 00
55: 00
56: 00
57: 00
58: 00
59: 00
5a: 04
5b: 00
5c: 00
5d: 00
5e: 00
5f: 00
60: 23
61: 01
62: 23
63: 01
64: 23
65: 00
66: 23
67: 00
68: fc
69: e4
6a: 00
6b: 00
6c: 00
6d: 00
6e: 00
6f: 30
70: 00
71: 60
72: f0
73: 00
74: 4e
75: 00
76: 63

--nextPart1912670.fxPD9czOLF
Content-Disposition: attachment; filename="vc5-next+1-4-display-off.log"
Content-Transfer-Encoding: 7Bit
Content-Type: text/x-log; charset="UTF-8"; name="vc5-next+1-4-display-off.log"

-------- i2cdump --------
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f    0123456789abcdef
00: 61 ff 00 00 00 00 00 00 00 ff 01 c0 00 b6 b4 92    a.........??.???
10: 8a 2a 81 80 00 03 84 03 60 00 00 00 1f fd f0 80    ?*??.???`...????
20: 00 81 00 5d 17 44 00 00 00 00 04 00 00 00 90 00    .?.]?D....?...?.
30: 00 81 03 13 b1 38 00 00 00 00 00 00 00 01 40 00    .????8.......?@.
40: 00 00 00 00 00 00 00 00 00 00 04 00 00 00 00 00    ..........?.....
50: 00 00 00 00 00 00 00 00 00 00 04 00 00 00 00 00    ..........?.....
60: 23 01 23 01 23 00 23 00 fc e4 00 00 00 00 00 30    #?#?#.#.??.....0
70: 00 60 f0 00 4e 00 63 00 00 10 02 08 6e 05 14 02    .`?.N.c..???n???
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
90: 00 00 00 00 00 00 00 00 00 56 00 00 00 90 94 b4    .........V...???
a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
-------- /sys/kernel/debug/regmap/4-006a/access --------
00: y n n n
01: y n n n
02: y n n n
03: y n n n
04: y n n n
05: y n n n
06: y n n n
07: y n n n
08: y n n n
09: y n n n
0a: y n n n
0b: y n n n
0c: y n n n
0d: y n n n
0e: y n n n
0f: y n n n
10: y y n n
11: y y n n
12: y y n n
13: y y n n
14: y n n n
15: y y n n
16: y y n n
17: y y n n
18: y y n n
19: y y n n
1a: y y n n
1b: y y n n
1c: y n n n
1d: y n n n
1e: y y n n
1f: y y n n
20: y y n n
21: y y n n
22: y y n n
23: y y n n
24: y y n n
25: y y n n
26: y y n n
27: y y n n
28: y y n n
29: y y n n
2a: y y n n
2b: y y n n
2c: y y n n
2d: y y n n
2e: y y n n
2f: y y n n
30: y y n n
31: y y n n
32: y y n n
33: y y n n
34: y y n n
35: y y n n
36: y y n n
37: y y n n
38: y y n n
39: y y n n
3a: y y n n
3b: y y n n
3c: y y n n
3d: y y n n
3e: y y n n
3f: y y n n
40: y y n n
41: y y n n
42: y y n n
43: y y n n
44: y y n n
45: y y n n
46: y y n n
47: y y n n
48: y y n n
49: y y n n
4a: y y n n
4b: y y n n
4c: y y n n
4d: y y n n
4e: y y n n
4f: y y n n
50: y y n n
51: y y n n
52: y y n n
53: y y n n
54: y y n n
55: y y n n
56: y y n n
57: y y n n
58: y y n n
59: y y n n
5a: y y n n
5b: y y n n
5c: y y n n
5d: y y n n
5e: y y n n
5f: y y n n
60: y y n n
61: y y n n
62: y y n n
63: y y n n
64: y y n n
65: y y n n
66: y y n n
67: y y n n
68: y y n n
69: y y n n
6a: y y n n
6b: y y n n
6c: y y n n
6d: y y n n
6e: y y n n
6f: y y n n
70: y y n n
71: y y n n
72: y y n n
73: y y n n
74: y y n n
75: y y n n
76: y y n n
-------- /sys/kernel/debug/regmap/4-006a/cache_bypass --------
N
-------- /sys/kernel/debug/regmap/4-006a/cache_dirty --------
N
-------- /sys/kernel/debug/regmap/4-006a/cache_only --------
N
-------- /sys/kernel/debug/regmap/4-006a/name --------
vc5
-------- /sys/kernel/debug/regmap/4-006a/range --------
0-76
-------- /sys/kernel/debug/regmap/4-006a/rbtree --------
0-76 (119)
1 nodes, 119 registers, average 119 registers, used 199 bytes
-------- /sys/kernel/debug/regmap/4-006a/registers --------
00: 61
01: ff
02: 00
03: 00
04: 00
05: 00
06: 00
07: 00
08: 00
09: ff
0a: 01
0b: c0
0c: 00
0d: b6
0e: b4
0f: 92
10: 8a
11: 2a
12: 81
13: 80
14: 00
15: 03
16: 84
17: 03
18: 60
19: 00
1a: 00
1b: 00
1c: 1f
1d: fd
1e: f0
1f: 80
20: 00
21: 81
22: 00
23: 5d
24: 17
25: 44
26: 00
27: 00
28: 00
29: 00
2a: 04
2b: 00
2c: 00
2d: 00
2e: 90
2f: 00
30: 00
31: 81
32: 03
33: 13
34: b1
35: 38
36: 00
37: 00
38: 00
39: 00
3a: 00
3b: 00
3c: 00
3d: 01
3e: 40
3f: 00
40: 00
41: 00
42: 00
43: 00
44: 00
45: 00
46: 00
47: 00
48: 00
49: 00
4a: 04
4b: 00
4c: 00
4d: 00
4e: 00
4f: 00
50: 00
51: 00
52: 00
53: 00
54: 00
55: 00
56: 00
57: 00
58: 00
59: 00
5a: 04
5b: 00
5c: 00
5d: 00
5e: 00
5f: 00
60: 23
61: 01
62: 23
63: 01
64: 23
65: 00
66: 23
67: 00
68: fc
69: e4
6a: 00
6b: 00
6c: 00
6d: 00
6e: 00
6f: 30
70: 00
71: 60
72: f0
73: 00
74: 4e
75: 00
76: 63

--nextPart1912670.fxPD9czOLF
Content-Disposition: attachment; filename="vc5-next+2-1-boot.log"
Content-Transfer-Encoding: 7Bit
Content-Type: text/x-log; charset="UTF-8"; name="vc5-next+2-1-boot.log"

-------- i2cdump --------
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f    0123456789abcdef
00: 61 ff 00 00 00 00 00 00 00 ff 01 c0 00 b6 b4 92    a.........??.???
10: 8a 2a 81 80 00 03 84 03 60 00 00 00 1f fd f0 80    ?*??.???`...????
20: 00 81 00 5d 17 44 00 00 00 00 04 00 00 00 90 00    .?.]?D....?...?.
30: 00 81 02 00 00 00 00 00 00 00 04 00 00 00 c0 00    .??.......?...?.
40: 00 00 00 00 00 00 00 00 00 00 04 00 00 00 00 00    ..........?.....
50: 00 00 00 00 00 00 00 00 00 00 04 00 00 00 00 00    ..........?.....
60: 23 01 23 01 23 00 23 00 fc e4 00 00 00 00 00 30    #?#?#.#.??.....0
70: 00 60 f0 00 4e 00 63 00 00 10 02 08 6e 05 14 02    .`?.N.c..???n???
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
90: 00 00 00 00 00 00 00 00 00 56 00 00 00 90 94 b4    .........V...???
a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
-------- /sys/kernel/debug/regmap/4-006a/access --------
00: y n n n
01: y n n n
02: y n n n
03: y n n n
04: y n n n
05: y n n n
06: y n n n
07: y n n n
08: y n n n
09: y n n n
0a: y n n n
0b: y n n n
0c: y n n n
0d: y n n n
0e: y n n n
0f: y n n n
10: y y n n
11: y y n n
12: y y n n
13: y y n n
14: y n n n
15: y y n n
16: y y n n
17: y y n n
18: y y n n
19: y y n n
1a: y y n n
1b: y y n n
1c: y n n n
1d: y n n n
1e: y y n n
1f: y y n n
20: y y n n
21: y y n n
22: y y n n
23: y y n n
24: y y n n
25: y y n n
26: y y n n
27: y y n n
28: y y n n
29: y y n n
2a: y y n n
2b: y y n n
2c: y y n n
2d: y y n n
2e: y y n n
2f: y y n n
30: y y n n
31: y y n n
32: y y n n
33: y y n n
34: y y n n
35: y y n n
36: y y n n
37: y y n n
38: y y n n
39: y y n n
3a: y y n n
3b: y y n n
3c: y y n n
3d: y y n n
3e: y y n n
3f: y y n n
40: y y n n
41: y y n n
42: y y n n
43: y y n n
44: y y n n
45: y y n n
46: y y n n
47: y y n n
48: y y n n
49: y y n n
4a: y y n n
4b: y y n n
4c: y y n n
4d: y y n n
4e: y y n n
4f: y y n n
50: y y n n
51: y y n n
52: y y n n
53: y y n n
54: y y n n
55: y y n n
56: y y n n
57: y y n n
58: y y n n
59: y y n n
5a: y y n n
5b: y y n n
5c: y y n n
5d: y y n n
5e: y y n n
5f: y y n n
60: y y n n
61: y y n n
62: y y n n
63: y y n n
64: y y n n
65: y y n n
66: y y n n
67: y y n n
68: y y n n
69: y y n n
6a: y y n n
6b: y y n n
6c: y y n n
6d: y y n n
6e: y y n n
6f: y y n n
70: y y n n
71: y y n n
72: y y n n
73: y y n n
74: y y n n
75: y y n n
76: y y n n
-------- /sys/kernel/debug/regmap/4-006a/cache_bypass --------
N
-------- /sys/kernel/debug/regmap/4-006a/cache_dirty --------
N
-------- /sys/kernel/debug/regmap/4-006a/cache_only --------
N
-------- /sys/kernel/debug/regmap/4-006a/name --------
vc5
-------- /sys/kernel/debug/regmap/4-006a/range --------
0-76
-------- /sys/kernel/debug/regmap/4-006a/rbtree --------
10-5e (79)
1 nodes, 79 registers, average 79 registers, used 159 bytes
-------- /sys/kernel/debug/regmap/4-006a/registers --------
00: 61
01: ff
02: 00
03: 00
04: 00
05: 00
06: 00
07: 00
08: 00
09: ff
0a: 01
0b: c0
0c: 00
0d: b6
0e: b4
0f: 92
10: 8a
11: 2a
12: 81
13: 80
14: 00
15: 03
16: 84
17: 03
18: 60
19: 00
1a: 00
1b: 00
1c: 1f
1d: fd
1e: f0
1f: 80
20: 00
21: 81
22: 00
23: 5d
24: 17
25: 44
26: 00
27: 00
28: 00
29: 00
2a: 04
2b: 00
2c: 00
2d: 00
2e: 90
2f: 00
30: 00
31: 81
32: 02
33: 00
34: 00
35: 00
36: 00
37: 00
38: 00
39: 00
3a: 04
3b: 00
3c: 00
3d: 00
3e: c0
3f: 00
40: 00
41: 00
42: 00
43: 00
44: 00
45: 00
46: 00
47: 00
48: 00
49: 00
4a: 04
4b: 00
4c: 00
4d: 00
4e: 00
4f: 00
50: 00
51: 00
52: 00
53: 00
54: 00
55: 00
56: 00
57: 00
58: 00
59: 00
5a: 04
5b: 00
5c: 00
5d: 00
5e: 00
5f: 00
60: 23
61: 01
62: 23
63: 01
64: 23
65: 00
66: 23
67: 00
68: fc
69: e4
6a: 00
6b: 00
6c: 00
6d: 00
6e: 00
6f: 30
70: 00
71: 60
72: f0
73: 00
74: 4e
75: 00
76: 63

--nextPart1912670.fxPD9czOLF
Content-Disposition: attachment; filename="vc5-next+2-2-display-on.log"
Content-Transfer-Encoding: 7Bit
Content-Type: text/x-log; charset="UTF-8"; name="vc5-next+2-2-display-on.log"

-------- i2cdump --------
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f    0123456789abcdef
00: 61 ff 00 00 00 00 00 00 00 ff 01 c0 00 b6 b4 92    a.........??.???
10: 8a 2a 81 80 00 03 84 03 60 00 00 00 1f fd f0 80    ?*??.???`...????
20: 00 81 00 5d 17 44 00 00 00 00 04 00 00 00 90 00    .?.]?D....?...?.
30: 00 81 03 13 b1 38 00 00 00 00 00 00 00 01 40 00    .????8.......?@.
40: 00 00 00 00 00 00 00 00 00 00 04 00 00 00 00 00    ..........?.....
50: 00 00 00 00 00 00 00 00 00 00 04 00 00 00 00 00    ..........?.....
60: 23 01 23 01 23 00 23 00 fc e4 00 00 00 00 00 30    #?#?#.#.??.....0
70: 00 60 f0 00 4e 00 63 00 00 10 02 08 6e 05 14 02    .`?.N.c..???n???
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
90: 00 00 00 00 00 00 00 00 00 56 00 00 00 90 94 b4    .........V...???
a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
-------- /sys/kernel/debug/regmap/4-006a/access --------
00: y n n n
01: y n n n
02: y n n n
03: y n n n
04: y n n n
05: y n n n
06: y n n n
07: y n n n
08: y n n n
09: y n n n
0a: y n n n
0b: y n n n
0c: y n n n
0d: y n n n
0e: y n n n
0f: y n n n
10: y y n n
11: y y n n
12: y y n n
13: y y n n
14: y n n n
15: y y n n
16: y y n n
17: y y n n
18: y y n n
19: y y n n
1a: y y n n
1b: y y n n
1c: y n n n
1d: y n n n
1e: y y n n
1f: y y n n
20: y y n n
21: y y n n
22: y y n n
23: y y n n
24: y y n n
25: y y n n
26: y y n n
27: y y n n
28: y y n n
29: y y n n
2a: y y n n
2b: y y n n
2c: y y n n
2d: y y n n
2e: y y n n
2f: y y n n
30: y y n n
31: y y n n
32: y y n n
33: y y n n
34: y y n n
35: y y n n
36: y y n n
37: y y n n
38: y y n n
39: y y n n
3a: y y n n
3b: y y n n
3c: y y n n
3d: y y n n
3e: y y n n
3f: y y n n
40: y y n n
41: y y n n
42: y y n n
43: y y n n
44: y y n n
45: y y n n
46: y y n n
47: y y n n
48: y y n n
49: y y n n
4a: y y n n
4b: y y n n
4c: y y n n
4d: y y n n
4e: y y n n
4f: y y n n
50: y y n n
51: y y n n
52: y y n n
53: y y n n
54: y y n n
55: y y n n
56: y y n n
57: y y n n
58: y y n n
59: y y n n
5a: y y n n
5b: y y n n
5c: y y n n
5d: y y n n
5e: y y n n
5f: y y n n
60: y y n n
61: y y n n
62: y y n n
63: y y n n
64: y y n n
65: y y n n
66: y y n n
67: y y n n
68: y y n n
69: y y n n
6a: y y n n
6b: y y n n
6c: y y n n
6d: y y n n
6e: y y n n
6f: y y n n
70: y y n n
71: y y n n
72: y y n n
73: y y n n
74: y y n n
75: y y n n
76: y y n n
-------- /sys/kernel/debug/regmap/4-006a/cache_bypass --------
N
-------- /sys/kernel/debug/regmap/4-006a/cache_dirty --------
N
-------- /sys/kernel/debug/regmap/4-006a/cache_only --------
N
-------- /sys/kernel/debug/regmap/4-006a/name --------
vc5
-------- /sys/kernel/debug/regmap/4-006a/range --------
0-76
-------- /sys/kernel/debug/regmap/4-006a/rbtree --------
0-76 (119)
1 nodes, 119 registers, average 119 registers, used 199 bytes
-------- /sys/kernel/debug/regmap/4-006a/registers --------
00: 61
01: ff
02: 00
03: 00
04: 00
05: 00
06: 00
07: 00
08: 00
09: ff
0a: 01
0b: c0
0c: 00
0d: b6
0e: b4
0f: 92
10: 8a
11: 2a
12: 81
13: 80
14: 00
15: 03
16: 84
17: 03
18: 60
19: 00
1a: 00
1b: 00
1c: 1f
1d: fd
1e: f0
1f: 80
20: 00
21: 81
22: 00
23: 5d
24: 17
25: 44
26: 00
27: 00
28: 00
29: 00
2a: 04
2b: 00
2c: 00
2d: 00
2e: 90
2f: 00
30: 00
31: 81
32: 03
33: 13
34: b1
35: 38
36: 00
37: 00
38: 00
39: 00
3a: 00
3b: 00
3c: 00
3d: 01
3e: 40
3f: 00
40: 00
41: 00
42: 00
43: 00
44: 00
45: 00
46: 00
47: 00
48: 00
49: 00
4a: 04
4b: 00
4c: 00
4d: 00
4e: 00
4f: 00
50: 00
51: 00
52: 00
53: 00
54: 00
55: 00
56: 00
57: 00
58: 00
59: 00
5a: 04
5b: 00
5c: 00
5d: 00
5e: 00
5f: 00
60: 23
61: 01
62: 23
63: 01
64: 23
65: 00
66: 23
67: 00
68: fc
69: e4
6a: 00
6b: 00
6c: 00
6d: 00
6e: 00
6f: 30
70: 00
71: 60
72: f0
73: 00
74: 4e
75: 00
76: 63

--nextPart1912670.fxPD9czOLF
Content-Disposition: attachment; filename="vc5-next+2-3-post-suspend.log"
Content-Transfer-Encoding: 7Bit
Content-Type: text/x-log; charset="UTF-8"; name="vc5-next+2-3-post-suspend.log"

-------- i2cdump --------
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f    0123456789abcdef
00: 61 ff 00 00 00 00 00 00 00 ff 01 c0 00 b6 b4 92    a.........??.???
10: 8a 2a 81 80 00 03 84 03 60 00 00 00 1f fd f0 80    ?*??.???`...????
20: 00 81 00 5d 17 44 00 00 00 00 04 00 00 00 90 00    .?.]?D....?...?.
30: 00 81 03 13 b1 38 00 00 00 00 00 00 00 01 40 00    .????8.......?@.
40: 00 00 00 00 00 00 00 00 00 00 04 00 00 00 00 00    ..........?.....
50: 00 00 00 00 00 00 00 00 00 00 04 00 00 00 00 00    ..........?.....
60: 23 01 23 01 23 00 23 00 fc e4 00 00 00 00 00 30    #?#?#.#.??.....0
70: 00 60 f0 00 4e 00 63 00 00 10 02 08 6e 05 14 02    .`?.N.c..???n???
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
90: 00 00 00 00 00 00 00 00 00 56 00 00 00 90 94 b4    .........V...???
a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
-------- /sys/kernel/debug/regmap/4-006a/access --------
00: y n n n
01: y n n n
02: y n n n
03: y n n n
04: y n n n
05: y n n n
06: y n n n
07: y n n n
08: y n n n
09: y n n n
0a: y n n n
0b: y n n n
0c: y n n n
0d: y n n n
0e: y n n n
0f: y n n n
10: y y n n
11: y y n n
12: y y n n
13: y y n n
14: y n n n
15: y y n n
16: y y n n
17: y y n n
18: y y n n
19: y y n n
1a: y y n n
1b: y y n n
1c: y n n n
1d: y n n n
1e: y y n n
1f: y y n n
20: y y n n
21: y y n n
22: y y n n
23: y y n n
24: y y n n
25: y y n n
26: y y n n
27: y y n n
28: y y n n
29: y y n n
2a: y y n n
2b: y y n n
2c: y y n n
2d: y y n n
2e: y y n n
2f: y y n n
30: y y n n
31: y y n n
32: y y n n
33: y y n n
34: y y n n
35: y y n n
36: y y n n
37: y y n n
38: y y n n
39: y y n n
3a: y y n n
3b: y y n n
3c: y y n n
3d: y y n n
3e: y y n n
3f: y y n n
40: y y n n
41: y y n n
42: y y n n
43: y y n n
44: y y n n
45: y y n n
46: y y n n
47: y y n n
48: y y n n
49: y y n n
4a: y y n n
4b: y y n n
4c: y y n n
4d: y y n n
4e: y y n n
4f: y y n n
50: y y n n
51: y y n n
52: y y n n
53: y y n n
54: y y n n
55: y y n n
56: y y n n
57: y y n n
58: y y n n
59: y y n n
5a: y y n n
5b: y y n n
5c: y y n n
5d: y y n n
5e: y y n n
5f: y y n n
60: y y n n
61: y y n n
62: y y n n
63: y y n n
64: y y n n
65: y y n n
66: y y n n
67: y y n n
68: y y n n
69: y y n n
6a: y y n n
6b: y y n n
6c: y y n n
6d: y y n n
6e: y y n n
6f: y y n n
70: y y n n
71: y y n n
72: y y n n
73: y y n n
74: y y n n
75: y y n n
76: y y n n
-------- /sys/kernel/debug/regmap/4-006a/cache_bypass --------
N
-------- /sys/kernel/debug/regmap/4-006a/cache_dirty --------
N
-------- /sys/kernel/debug/regmap/4-006a/cache_only --------
N
-------- /sys/kernel/debug/regmap/4-006a/name --------
vc5
-------- /sys/kernel/debug/regmap/4-006a/range --------
0-76
-------- /sys/kernel/debug/regmap/4-006a/rbtree --------
0-76 (119)
1 nodes, 119 registers, average 119 registers, used 199 bytes
-------- /sys/kernel/debug/regmap/4-006a/registers --------
00: 61
01: ff
02: 00
03: 00
04: 00
05: 00
06: 00
07: 00
08: 00
09: ff
0a: 01
0b: c0
0c: 00
0d: b6
0e: b4
0f: 92
10: 8a
11: 2a
12: 81
13: 80
14: 00
15: 03
16: 84
17: 03
18: 60
19: 00
1a: 00
1b: 00
1c: 1f
1d: fd
1e: f0
1f: 80
20: 00
21: 81
22: 00
23: 5d
24: 17
25: 44
26: 00
27: 00
28: 00
29: 00
2a: 04
2b: 00
2c: 00
2d: 00
2e: 90
2f: 00
30: 00
31: 81
32: 03
33: 13
34: b1
35: 38
36: 00
37: 00
38: 00
39: 00
3a: 00
3b: 00
3c: 00
3d: 01
3e: 40
3f: 00
40: 00
41: 00
42: 00
43: 00
44: 00
45: 00
46: 00
47: 00
48: 00
49: 00
4a: 04
4b: 00
4c: 00
4d: 00
4e: 00
4f: 00
50: 00
51: 00
52: 00
53: 00
54: 00
55: 00
56: 00
57: 00
58: 00
59: 00
5a: 04
5b: 00
5c: 00
5d: 00
5e: 00
5f: 00
60: 23
61: 01
62: 23
63: 01
64: 23
65: 00
66: 23
67: 00
68: fc
69: e4
6a: 00
6b: 00
6c: 00
6d: 00
6e: 00
6f: 30
70: 00
71: 60
72: f0
73: 00
74: 4e
75: 00
76: 63

--nextPart1912670.fxPD9czOLF
Content-Disposition: attachment; filename="vc5-next+2-4-display-off.log"
Content-Transfer-Encoding: 7Bit
Content-Type: text/x-log; charset="UTF-8"; name="vc5-next+2-4-display-off.log"

-------- i2cdump --------
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f    0123456789abcdef
00: 61 ff 00 00 00 00 00 00 00 ff 01 c0 00 b6 b4 92    a.........??.???
10: 8a 2a 81 80 00 03 84 03 60 00 00 00 1f fd f0 80    ?*??.???`...????
20: 00 81 00 5d 17 44 00 00 00 00 04 00 00 00 90 00    .?.]?D....?...?.
30: 00 81 03 13 b1 38 00 00 00 00 00 00 00 01 40 00    .????8.......?@.
40: 00 00 00 00 00 00 00 00 00 00 04 00 00 00 00 00    ..........?.....
50: 00 00 00 00 00 00 00 00 00 00 04 00 00 00 00 00    ..........?.....
60: 23 01 23 01 23 00 23 00 fc e4 00 00 00 00 00 30    #?#?#.#.??.....0
70: 00 60 f0 00 4e 00 63 00 00 10 02 08 6e 05 14 02    .`?.N.c..???n???
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
90: 00 00 00 00 00 00 00 00 00 56 00 00 00 90 94 b4    .........V...???
a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
-------- /sys/kernel/debug/regmap/4-006a/access --------
00: y n n n
01: y n n n
02: y n n n
03: y n n n
04: y n n n
05: y n n n
06: y n n n
07: y n n n
08: y n n n
09: y n n n
0a: y n n n
0b: y n n n
0c: y n n n
0d: y n n n
0e: y n n n
0f: y n n n
10: y y n n
11: y y n n
12: y y n n
13: y y n n
14: y n n n
15: y y n n
16: y y n n
17: y y n n
18: y y n n
19: y y n n
1a: y y n n
1b: y y n n
1c: y n n n
1d: y n n n
1e: y y n n
1f: y y n n
20: y y n n
21: y y n n
22: y y n n
23: y y n n
24: y y n n
25: y y n n
26: y y n n
27: y y n n
28: y y n n
29: y y n n
2a: y y n n
2b: y y n n
2c: y y n n
2d: y y n n
2e: y y n n
2f: y y n n
30: y y n n
31: y y n n
32: y y n n
33: y y n n
34: y y n n
35: y y n n
36: y y n n
37: y y n n
38: y y n n
39: y y n n
3a: y y n n
3b: y y n n
3c: y y n n
3d: y y n n
3e: y y n n
3f: y y n n
40: y y n n
41: y y n n
42: y y n n
43: y y n n
44: y y n n
45: y y n n
46: y y n n
47: y y n n
48: y y n n
49: y y n n
4a: y y n n
4b: y y n n
4c: y y n n
4d: y y n n
4e: y y n n
4f: y y n n
50: y y n n
51: y y n n
52: y y n n
53: y y n n
54: y y n n
55: y y n n
56: y y n n
57: y y n n
58: y y n n
59: y y n n
5a: y y n n
5b: y y n n
5c: y y n n
5d: y y n n
5e: y y n n
5f: y y n n
60: y y n n
61: y y n n
62: y y n n
63: y y n n
64: y y n n
65: y y n n
66: y y n n
67: y y n n
68: y y n n
69: y y n n
6a: y y n n
6b: y y n n
6c: y y n n
6d: y y n n
6e: y y n n
6f: y y n n
70: y y n n
71: y y n n
72: y y n n
73: y y n n
74: y y n n
75: y y n n
76: y y n n
-------- /sys/kernel/debug/regmap/4-006a/cache_bypass --------
N
-------- /sys/kernel/debug/regmap/4-006a/cache_dirty --------
N
-------- /sys/kernel/debug/regmap/4-006a/cache_only --------
N
-------- /sys/kernel/debug/regmap/4-006a/name --------
vc5
-------- /sys/kernel/debug/regmap/4-006a/range --------
0-76
-------- /sys/kernel/debug/regmap/4-006a/rbtree --------
0-76 (119)
1 nodes, 119 registers, average 119 registers, used 199 bytes
-------- /sys/kernel/debug/regmap/4-006a/registers --------
00: 61
01: ff
02: 00
03: 00
04: 00
05: 00
06: 00
07: 00
08: 00
09: ff
0a: 01
0b: c0
0c: 00
0d: b6
0e: b4
0f: 92
10: 8a
11: 2a
12: 81
13: 80
14: 00
15: 03
16: 84
17: 03
18: 60
19: 00
1a: 00
1b: 00
1c: 1f
1d: fd
1e: f0
1f: 80
20: 00
21: 81
22: 00
23: 5d
24: 17
25: 44
26: 00
27: 00
28: 00
29: 00
2a: 04
2b: 00
2c: 00
2d: 00
2e: 90
2f: 00
30: 00
31: 81
32: 03
33: 13
34: b1
35: 38
36: 00
37: 00
38: 00
39: 00
3a: 00
3b: 00
3c: 00
3d: 01
3e: 40
3f: 00
40: 00
41: 00
42: 00
43: 00
44: 00
45: 00
46: 00
47: 00
48: 00
49: 00
4a: 04
4b: 00
4c: 00
4d: 00
4e: 00
4f: 00
50: 00
51: 00
52: 00
53: 00
54: 00
55: 00
56: 00
57: 00
58: 00
59: 00
5a: 04
5b: 00
5c: 00
5d: 00
5e: 00
5f: 00
60: 23
61: 01
62: 23
63: 01
64: 23
65: 00
66: 23
67: 00
68: fc
69: e4
6a: 00
6b: 00
6c: 00
6d: 00
6e: 00
6f: 30
70: 00
71: 60
72: f0
73: 00
74: 4e
75: 00
76: 63

--nextPart1912670.fxPD9czOLF--



