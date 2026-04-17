Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A161B279DCA
	for <linux-clk@vger.kernel.org>; Fri, 17 Apr 2026 15:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776438718; cv=none; b=gBJRH2GqjjtVt14IZIK2tsGzNm+6fLZwJKS2COt/82Bpnz4Zh/TTBMxNwSTtxx9A/84RolOTPfNlCjjUdsRaKcSfS6UR1fuqjVlsejbmH98JTer/DXQn0qSF09leLopkWnxbiiBrSCv+nRAtF1j/Y7dmrbF5FaI83j2qVmUYRaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776438718; c=relaxed/simple;
	bh=eG6IXyh4y0jftfvJQuYeuV3rZuFLFef4kpCOHmG+mBg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UNtBLgYXwiJiAs1qnJpfYicetPenqkCCP4+c4eKKFzEJ5QxDsVW2o60zMd4Kin+a4GKYC0sUgIuIK4DnZ9dCLgThFSN58Qlt+hJX0ZB0Sp9B4XUWtFb1g5EfSuvc1P3nSzp4GhrUe2HxhjtUVPjkwNVDOaMuFZEq2gIoIeuBgrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=QkxLvHVx; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="QkxLvHVx"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43d73422431so600650f8f.2
        for <linux-clk@vger.kernel.org>; Fri, 17 Apr 2026 08:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1776438715; x=1777043515; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sQg7mK9oWEfVQ2/f5M3NYZgfP1n9UD9hwZDhumEKaq0=;
        b=QkxLvHVxW2Z+SHbiI0NK7acDx14gZVT5ucGVy81JqXKA3lIFWUUwTf6MN540dn+nqX
         81LwSVZpZuQgVWuMMmpsavd06WghCRFDw8AP2/WHNTtwrPrJnDNxBM7WGoh6uVVYwJt2
         ENCY3pfshDEOHCGEAN5AZBOk9uvE/CIVNkyzkV4ayUiNdLErUUhOcx2Sd6F7sDDqhdk5
         f9SkFC55mR6J8CcqjA94ElgPM/3qaaeFpLCm+HG1tvRqtV8Y/8FI2jISWpx/54Ci4DsG
         mqOR+aTWuRCNvIYgXtrQMbBlf9cPyDLrE5bEigKIVpIuhPmknaudhccPFkp9QBE+79iG
         jeKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776438715; x=1777043515;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sQg7mK9oWEfVQ2/f5M3NYZgfP1n9UD9hwZDhumEKaq0=;
        b=re+14APZiA68BbYvhwwRNIEL43XS4K5WvEd1B9PQd1lv8rFFAbiMsY2g8ijU8hdGOW
         vzyn0taOVgtZToWoK8SSwOzw5c12Sgh5/flq024QD/mgeyt+fPXYo4ttGUSN2zGy3CAw
         bQzO+pQKd9EBj8pT8WvK6cq60r/zKkooSxDNdpfXBQ8THlrfkbJfYX1B0K4RvquU2rKy
         AL5BORN7i3fxGEb9bEPUwqOK0+3oolLNjsGKBYXs/PZ6ObvVL150Qkhq9IOC0koerrLc
         3i9fX766YdznZXsESveO++ghIxs0Qguxh0Ygqfatb7W3NEBPGEgax1sYaaachyKTmeoI
         q/NA==
X-Forwarded-Encrypted: i=1; AFNElJ+V86hSBE1LW/1Ipfb1JPpPne9M1SvxMeieqPVjMeH4xRU2ykNREBoSU+n2JBJVDmG92blfWpJMWYU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaVZ97N37duqkZJUyQlqtpg00l7cmdqJKRCSH/E9gP0DVF8dWq
	X+iZ6zokfCkO9l1OAVus7Rz9nAcafyY9YERBepzf2osvK0pfHfbfihdEkXtD6/E/IvE=
X-Gm-Gg: AeBDieuMFKd0SpmJkTGrFglue65NkZwebcj3yuXxIv6Jux7UT3YCtsQ6PdqybGO2r3a
	cBVYWhfOHcDPzRj/q+up2aIIrwSl7hZvyOn7wPWJoWHsLQS1/g5JGkgrnLXjdr8b/OKn+TPHruB
	JWH7Xr4qQvffWmsKGpdvrvkz6az2MZ8XBSaQQE+3QDELwnxNsChG2Ujb1IvdsNdmVR1+STSLNJu
	9r/nwjb72Dnz1UchIiAOSTGHc3ntUFhmi01dfS55FHhipRx9uuqT5fI+JL/PfbuF4we6FrUPPOx
	KR6Stn07IuvgWXPR/yzmOqWIifW1r3fusKCuk8hGP6vMFkKP9kqu3wweBtibEH++0+C5sGLzIVT
	Nby7kIALRclE9LWBmaT8d2tAIKIA8OwYvx6yGib5KvpKZgfolfhYbNAgdWfcfA6thK4T/Mlare5
	xGJvYJKyK9Bpy+Y/8CEbfJRmGNxrs+XXL1rSdMSdoVtnrvP6U5NTjSt+L8UoDLzxbriUtBjw60O
	FmYAG56Y+DDbCvH
X-Received: by 2002:a05:6000:25c6:b0:43d:7af0:3a7c with SMTP id ffacd0b85a97d-43fe3e0d44emr5071076f8f.29.1776438714844;
        Fri, 17 Apr 2026 08:11:54 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-109.alshamil.net.ae. [86.98.192.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e591cesm7376426f8f.36.2026.04.17.08.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 08:11:54 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Subject: [PATCH RFC 0/4] arm64: rockchip: The hunt for exact pixel clocks
 on RK3576
Date: Fri, 17 Apr 2026 19:11:43 +0400
Message-Id: <20260417-rk3576-dclk-v1-0-26a9d0dcb2de@flipper.net>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK9N4mkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDE0Nz3aJsY1NzM92U5JxsXZNkS9OkpCQzc1MLQyWgjoKi1LTMCrBp0Up
 Bbs5KsbW1AIDnryliAAAA
X-Change-ID: 20260417-rk3576-dclk-4c95bbb67581
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Pavel Zhovner <pavel@flipper.net>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Andy Yan <andy.yan@rock-chips.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5622; i=alchark@flipper.net;
 h=from:subject:message-id; bh=eG6IXyh4y0jftfvJQuYeuV3rZuFLFef4kpCOHmG+mBg=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQ+8t2WWV9R/clycvGR0/uPTWCN3dJ9VT99gcTL/Hd5f
 GmKaUv4OiayMIhxMViKKbLM/bbEdqoR36xdHh5fYeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZjq9xmMDGuFlPK4MlSmfOu6l9yp8VWFYYnYIr53Sd8+n/vLFHqtfTsjw/UZxlM
 2PbvjOunWdh5h59QtF+ewbtocl+W88rtRnJeeISsA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Dear all,

Need the help of the collective wisdom of the community.

The problem I'm trying to solve is reliably obtaining the exact pixel
clock for arbitrary display modes supported by the RK3576 SoC.

Rockchip RK3576 has three display output processors VP0~VP2, each
supporting different ranges of display modes, roughly as follows:
- VP0: 4K 120Hz
- VP1: 2.5k 60Hz
- VP2: 1080p 60Hz

Each one obviously needs a pixel clock. The required frequencies for the
pixel clocks vary greatly depending on the display mode, and need to be
matched within a tight tolerance, or else many displays will refuse to
work. E.g. the preferred (maximum) display mode out of VP1 is particularly
awkward, because it requires a pixel clock of 248.88 MHz, which cannot
be obtained using integer dividers from its default clock source (GPLL
at 1188 MHz), and the nearest approximation is 237.6 MHz, which is well
outside the tolerance of e.g. DP specification, resulting in a blank
screen on most displays by default.

The clock sources are of course configurable, in particular there are muxes
connected to each VP for selecting the source of the pixel clock:
- Each VP can take the clock either from the (single!) HDMI PHY or from
  its dedicated dclk_vpX_src mux
- The dclk_vpX_src mux can select the clock from a number of system PLLs
  (GPLL, CPLL, VPLL, BPLL, LPLL)

While the system PLLs can be configured to output a wide range of
frequencies, they are shared between many system components. E.g. on the
current mainline kernel on one of my RK3576 boards I've got the following:
GPLL: 1188 MHz, enable count 20
CPLL: 1000 MHz, enable count 17
VPLL: 594 MHz, enable count 0 (yaay!)
BPLL, LPLL: 816 MHz, enable count 0 (but these last ones don't have
            predividers, so are less flexible)

So ultimately there is exactly one free fractional PLL (VPLL) which can be
used to generate arbitrary pixel clocks, but we have up to three consumers
trying to drive different display modes from it (e.g. HDMI on VP0, DP on
VP1 and MIPI DSI on VP2). We also want to be able to adjust the PLL output
frequency on the fly to satisfy the requirements of the selected display
mode.

And this is where I'm stuck. Trying to satisfy the requirements of up to
three consumers while changing the PLL frequency on the fly sounds like
a poorly tractable mathematical problem (is it 3-SAT?). We can take the
HDMI output out of the equation, because it can be driven from the HDMI
PHY (which is capable of arbitrary rates) instead of the mux, but that
makes the decision of which dclk source to use for a VP block dependent on
which downstream consumer is connected to it (HDMI vs. something else).
Even then we somehow need two devices to cooperate in picking a PLL
frequency that satisfies the requirements of both of them, and change to it
without display corruption. I'm not even sure if the CCF has mechanisms
for that?..

What follows is a brief set of patches which illustrate a partial solution
for the case of "I just need 2.5k60Hz on VP1 via DP and don't care about
the rest". It switches the VP1 unconditionally to use VPLL as the source
for its dclk mux, allows changing the VPLL frequency on the fly, and also
changes the frequency calculation logic to allow for nearest-match
frequencies which are not necessarily rounded down. These are not meant
to be merged as-is, as I see the following issues:
- The flag allowing the PLL to change rate is in the clock driver, while
  the reparenting to an unused PLL is in the device tree. If these go out
  of sync, we might end up trying to change the frequency of a PLL which
  is used by other consumers (I presume that could be dangerous)
- If VP0 happens to be driving DP output, it won't be able to produce the
  2560x1440@60Hz mode for the same reasons as VP1 - then it must also be
  reparented to VPLL and allowed to change its frequency on the fly

It does bring me from a state of "always blank screen on DP output until
the mode is switched to something magically working" to a state of
"most monitors work at the default preferred mode" though.

It is tempting to just reparent both VP0 and VP1 to VPLL and allow both of
them to change its frequency, while leaving VP2 on the default (fixed)
GPLL and relying on the fact that 148.5 MHz (the required frequency for
its maximum supported mode of 1920x1080@60Hz) is conveniently 1188/8 MHz -
just what GPLL can provide. Then also force whichever VP is driving HDMI
output to use the HDMI PHY as its clock source. But we still have the
problem of DT vs. driver coordination, and I'm not sure how to define
the policy for "if you've got HDMI connected, you must use the HDMI PHY
clock for the respective VP, whichever VP that is".

I would very much appreciate any thoughts on how to approach this.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
Alexey Charkov (4):
      arm64: dts: rockchip: rk3576: assign dclk_vp1_src to VPLL
      clk: rockchip: pll: use round-nearest in determine_rate
      clk: rockchip: rk3576: allow dclk_vp1_src to propagate rate to parent PLL
      clk: rockchip: rk3576: add ROUND_CLOSEST to dclk_vp1_src divider

 arch/arm64/boot/dts/rockchip/rk3576.dtsi |  2 ++
 drivers/clk/rockchip/clk-pll.c           | 16 ++++++++--------
 drivers/clk/rockchip/clk-rk3576.c        |  4 ++--
 3 files changed, 12 insertions(+), 10 deletions(-)
---
base-commit: c7275b05bc428c7373d97aa2da02d3a7fa6b9f66
change-id: 20260417-rk3576-dclk-4c95bbb67581

Best regards,
-- 
Alexey Charkov <alchark@flipper.net>

