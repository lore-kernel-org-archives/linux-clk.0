Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D38344D8C
	for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 16:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776700993; cv=none; b=HC92L7LML0TzrcR0ZCxu4X4xd/ao6iYT9cnRpqdNrbrt7a62ZgJ69N043vslfY7SGdwcRl30z3KJKegEyMIL8GpfkH9c5PoU6JcDVBt5s+auwD9YNosJUJPTCd1kgNdrfP0mk7NrH/p/+b8a1yKIcHFCRwtLInU8zEAee1Jexcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776700993; c=relaxed/simple;
	bh=UZ0LnI+rK/PjQVIk0Cm2exYRpKz3MgffCFQw0oVF2Ck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pafngEWKU1p8BFczGN1ey0O9MNvP12WydFwGMRH0C3KQ4ZxnE8ZGqP0bFsL3WeMJennQBlkdNZ0vGTNrP2MkeAjm/VzLttWhD5urSiJu/gQeFMmISbaiqV5MA3GjOCDSV+ULPHtzFjizOq7ZcBKLvE/cqy5XckIdugHM6Gclc4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WSNqzLzS; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y5nBYUa5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WSNqzLzS";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y5nBYUa5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776700990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h9/x0FxU8GBGhtJj7ey+dB7jEGAG86JGELTylQtF5nc=;
	b=WSNqzLzSs7pEUrm49Fz7aFurhC95GRO3TS5dYjKePd1CUc6ATEEsrPMHDllhzMVBufy0Lr
	k63NuBOFtZH14zaSlbwPEKD9S/nHaAlq1tmJyNf4C54ANJHFGHwOWVGmGYGuBpW7vNZxlJ
	qnTsnEmpAxExMfKbgownEKCneuJEqeM=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-226--nL66zhuM1ylNxPiwAVLzg-1; Mon, 20 Apr 2026 12:03:03 -0400
X-MC-Unique: -nL66zhuM1ylNxPiwAVLzg-1
X-Mimecast-MFC-AGG-ID: -nL66zhuM1ylNxPiwAVLzg_1776700983
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6101726c594so1101680137.0
        for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 09:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776700983; x=1777305783; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h9/x0FxU8GBGhtJj7ey+dB7jEGAG86JGELTylQtF5nc=;
        b=Y5nBYUa5g/vFjmGt7RYp1W9PH8SrSf/0HRiyPPmHhhqCB8PRty5wvO9h/2FP3G5tAG
         SM43CL/lshcjzUBuvKqF1Laadif7gdSdJ0yulLRlmpUv2urUQKRy0nXuinLWGS0pfIHx
         8LCrWjP5xFNQDb24p1SNf14oUhv309XheJFMw6cJp4JD6s9Jfr/Z9ObMq1LeaU7su+Jp
         cUyqyLL6q+QRbnqFaWW5ypg3T0S4XfQ3XMzUcu0o5CphZOu5f+WA8L+Nq0rafetqtLGz
         ogP44csSSoFKuLYleGsoGkavn3Vxnux4JSLdt/F7u0VSi6hwieZvKG8aChP640ouJ5mq
         W5Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776700983; x=1777305783;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h9/x0FxU8GBGhtJj7ey+dB7jEGAG86JGELTylQtF5nc=;
        b=NYeDMsVTEOWpdrAeHb550IvW0KMIK1itmSFpj5pq4lD3m40O9TVCNKBEGIEbTmg3Bp
         xDG9SKLXdoHoOSOHcJwUdSPLAIspGgZ217hvw65EMZ+tWigskKnLHcJx1rB79PZ6V5yK
         GPwHczPsjnjb/cjWP2hy0c2M5i/OyE+E+E2h8/b7qxqkcoA2P3jV/riB8cElJupovKIZ
         KE9uJkkTNZDImQg8d8LdNlsg5NIB6AoJRt9uES669c9RTWUb38h5Ctxn1JupQ68V/+yk
         HcRnrtYIYJQyNYQmgds4/brOhHwx8yv0rxx/IvykdwfSMGEvwmt4Xu5yJmCFQ8LqTc/g
         g4ow==
X-Forwarded-Encrypted: i=1; AFNElJ98OcgroszGcglpH8wZg7fn0bSnBZAxUsgPY9yGmmOFZEbGRYX95yfx9iLfjttKUta7R33IiF0hiMg=@vger.kernel.org
X-Gm-Message-State: AOJu0YydA9PaR1wDe9/EnuEDVpHn/WnOM2U+gKnmSDTULQ49Io1McRrV
	WXjBBbGAoo5fnVZvGvv2XHCUuPnK7F//zYnF7+bLI36DAzV9LYSbOA2ipaKHMgM1714jpMLA4eG
	RBq143eIXn0EGVAnjfK9iyMeJbb7CAjB57pao5DDyatWNrUBN5yaXEWj1Kjrt+A==
X-Gm-Gg: AeBDietfiRCyrhYx8x4kZBdnPfIB4QIsZ4QbhD3S2OisF0pHSvSApYDXRtNqXm4/1VG
	FMWtG2QwjTd7crujder8sW4MPsTbh+yR+0FCNd0Ao7/4mLoPq6OJ3tOR0Mf1rUuGyeFDXAJ5i1t
	Ekr9U0lMbn57f1V1X3AJknFO2qblHwJVHPr6BfBoGBRAqWbX5bsivqQJD9LsZ0MGfBMIOI+IpSI
	LHwPVp15XlMXdBnXrl91oBwDLQ7/45bUd4ejvFJVSq5ofnCivNTroR/lE0kk2PF+QLZWf9cyO0p
	h3JYS/0P4quYxLWHN8Vi08gfoLlTIVCkD+Qdz0zTASJTyjZPp9PX5r1L8DrxfTlwIRLDtHtSC12
	c0V9emmZLwyJYH57q6UPHUIWXpFAeAHeirJi1+/RN71sJQwxpyIw6fffxaZjJcrf3zF4=
X-Received: by 2002:a05:6102:5e98:b0:602:8ccb:c993 with SMTP id ada2fe7eead31-616f89b2062mr5555883137.24.1776700982365;
        Mon, 20 Apr 2026 09:03:02 -0700 (PDT)
X-Received: by 2002:a05:6102:5e98:b0:602:8ccb:c993 with SMTP id ada2fe7eead31-616f89b2062mr5555813137.24.1776700981596;
        Mon, 20 Apr 2026 09:03:01 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8e7d5fe9638sm840199685a.1.2026.04.20.09.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 09:03:00 -0700 (PDT)
Date: Mon, 20 Apr 2026 12:02:58 -0400
From: Brian Masney <bmasney@redhat.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Alexey Charkov <alchark@flipper.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Pavel Zhovner <pavel@flipper.net>,
	Andy Yan <andy.yan@rock-chips.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH RFC 0/4] arm64: rockchip: The hunt for exact pixel clocks
 on RK3576
Message-ID: <aeZOMnZfBcBHzR8c@redhat.com>
References: <20260417-rk3576-dclk-v1-0-26a9d0dcb2de@flipper.net>
 <aeKtNf8CCAWduI-f@venus>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="vZqQeRlEnk8S7HaS"
Content-Disposition: inline
In-Reply-To: <aeKtNf8CCAWduI-f@venus>
User-Agent: Mutt/2.3.1 (2026-03-20)


--vZqQeRlEnk8S7HaS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alexey,

On Sat, Apr 18, 2026 at 12:24:57AM +0200, Sebastian Reichel wrote:
> On Fri, Apr 17, 2026 at 07:11:43PM +0400, Alexey Charkov wrote:
> > Dear all,
> > 
> > Need the help of the collective wisdom of the community.
> > 
> > The problem I'm trying to solve is reliably obtaining the exact pixel
> > clock for arbitrary display modes supported by the RK3576 SoC.
> > 
> > Rockchip RK3576 has three display output processors VP0~VP2, each
> > supporting different ranges of display modes, roughly as follows:
> > - VP0: 4K 120Hz
> > - VP1: 2.5k 60Hz
> > - VP2: 1080p 60Hz
> > 
> > Each one obviously needs a pixel clock. The required frequencies for the
> > pixel clocks vary greatly depending on the display mode, and need to be
> > matched within a tight tolerance, or else many displays will refuse to
> > work. E.g. the preferred (maximum) display mode out of VP1 is particularly
> > awkward, because it requires a pixel clock of 248.88 MHz, which cannot
> > be obtained using integer dividers from its default clock source (GPLL
> > at 1188 MHz), and the nearest approximation is 237.6 MHz, which is well
> > outside the tolerance of e.g. DP specification, resulting in a blank
> > screen on most displays by default.
> > 
> > The clock sources are of course configurable, in particular there are muxes
> > connected to each VP for selecting the source of the pixel clock:
> > - Each VP can take the clock either from the (single!) HDMI PHY or from
> >   its dedicated dclk_vpX_src mux
> > - The dclk_vpX_src mux can select the clock from a number of system PLLs
> >   (GPLL, CPLL, VPLL, BPLL, LPLL)
> > 
> > While the system PLLs can be configured to output a wide range of
> > frequencies, they are shared between many system components. E.g. on the
> > current mainline kernel on one of my RK3576 boards I've got the following:
> > GPLL: 1188 MHz, enable count 20
> > CPLL: 1000 MHz, enable count 17
> > VPLL: 594 MHz, enable count 0 (yaay!)
> > BPLL, LPLL: 816 MHz, enable count 0 (but these last ones don't have
> >             predividers, so are less flexible)
> > 
> > So ultimately there is exactly one free fractional PLL (VPLL) which can be
> > used to generate arbitrary pixel clocks, but we have up to three consumers
> > trying to drive different display modes from it (e.g. HDMI on VP0, DP on
> > VP1 and MIPI DSI on VP2). We also want to be able to adjust the PLL output
> > frequency on the fly to satisfy the requirements of the selected display
> > mode.
> > 
> > And this is where I'm stuck. Trying to satisfy the requirements of up to
> > three consumers while changing the PLL frequency on the fly sounds like
> > a poorly tractable mathematical problem (is it 3-SAT?). We can take the
> > HDMI output out of the equation, because it can be driven from the HDMI
> > PHY (which is capable of arbitrary rates) instead of the mux, but that
> > makes the decision of which dclk source to use for a VP block dependent on
> > which downstream consumer is connected to it (HDMI vs. something else).
> 
> It becomes more messy: The HDMI PHY cannot be used as clock source
> for modes exceeding 4K@60Hz.
> 
> > Even then we somehow need two devices to cooperate in picking a PLL
> > frequency that satisfies the requirements of both of them, and change to it
> > without display corruption. I'm not even sure if the CCF has mechanisms
> > for that?..
> > 
> > What follows is a brief set of patches which illustrate a partial solution
> > for the case of "I just need 2.5k60Hz on VP1 via DP and don't care about
> > the rest". It switches the VP1 unconditionally to use VPLL as the source
> > for its dclk mux, allows changing the VPLL frequency on the fly, and also
> > changes the frequency calculation logic to allow for nearest-match
> > frequencies which are not necessarily rounded down. These are not meant
> > to be merged as-is, as I see the following issues:
> > - The flag allowing the PLL to change rate is in the clock driver, while
> >   the reparenting to an unused PLL is in the device tree. If these go out
> >   of sync, we might end up trying to change the frequency of a PLL which
> >   is used by other consumers (I presume that could be dangerous)
> 
> It is a problem, see e.g. this patch from Heiko removing the flag
> for an RK3588 VOP source clock:
> 
> https://lore.kernel.org/linux-rockchip/20251008133135.3745785-1-heiko@sntech.de/
> 
> Also note, that there is some more general ongoing work regarding
> this:
> 
> See: https://lore.kernel.org/linux-clk/20260327-clk-scaling-v8-0-86cd0aba3c5f@redhat.com/

I'm working on the patch set above to fix the clk scaling issues. You'll
have issues on clks that have CLK_SET_RATE_PARENT enabled, and there are
multiple children under that parent. Patches 2 and 4 in my series has
kunit tests that demonstrates the current behavior.

I attached a patch to drivers/clk/rockchip/clk-pll.c that adds support
for the v2 rate negotiation logic. You'll need to apply this on top my
clk scaling patch set. I only compile tested this, however it should work
based on the changes that I made to clk-divider.c.

You'll also need to add the flag CLK_V2_RATE_NEGOTIATION to your three
display clks. Otherwise, without the flag, it will just fall back to the
existing behavior.

Hopefully this will let you be able to use one of the PLLs that has a
high enable count as the parent.

Feel free to reach out to me if you have any questions or issues with
my patch set.

Brian

--vZqQeRlEnk8S7HaS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename=0001-clk-rockchip-pll-add-support-for-v2-rate-negotiation.patch

From 66b44d756dba0152b415cc8eb8528b55c4253058 Mon Sep 17 00:00:00 2001
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 20 Apr 2026 11:13:53 -0400
Subject: [PATCH] clk: rockchip: pll: add support for v2 rate negotiation logic
Content-type: text/plain

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/rockchip/clk-pll.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/clk/rockchip/clk-pll.c b/drivers/clk/rockchip/clk-pll.c
index 6b853800cb6b..30e0722f872f 100644
--- a/drivers/clk/rockchip/clk-pll.c
+++ b/drivers/clk/rockchip/clk-pll.c
@@ -66,8 +66,20 @@ static int rockchip_pll_determine_rate(struct clk_hw *hw,
 {
 	struct rockchip_clk_pll *pll = to_rockchip_clk_pll(hw);
 	const struct rockchip_pll_rate_table *rate_table = pll->rate_table;
+	struct clk_hw *parent = req->best_parent_hw;
 	int i;
 
+	if (parent && (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) &&
+	    clk_has_v2_rate_negotiation(parent->core)) {
+		unsigned long lcm_rate;
+
+		lcm_rate = clk_hw_get_children_lcm(parent, hw, req->rate);
+		if (lcm_rate > 0) {
+			lcm_rate = clk_hw_round_rate(parent, lcm_rate);
+			req->best_parent_rate = lcm_rate;
+		}
+	}
+
 	/* Assuming rate_table is in descending order */
 	for (i = 0; i < pll->rate_count; i++) {
 		if (req->rate >= rate_table[i].rate) {
-- 
2.53.0


--vZqQeRlEnk8S7HaS--

