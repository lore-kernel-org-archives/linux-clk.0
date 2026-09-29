Received: from sender6-op-o12.zoho.com (sender6-op-o12.zoho.com [165.173.180.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDBF4F4024;
	Tue, 29 Sep 2026 14:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790692088; cv=pass; b=mRtFqwUFqlD/7LflY0nS1OP1A10eq6nodhZUl+m3YZRfLLWhMOZaSS6FmKKdQ7q0ZFvKwOEIUOB6rpCgx+2XpP2WHXKghp03LNjBx3gjD05VHQUK88Uvy5lntwgNbSP6AaY/SmGjjpujsAZ94GdrQ4j5QgDJIP9Dd6ybr/4N6uA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790692088; c=relaxed/simple;
	bh=B+7p0nXl2g4IPDqxo0h8dt+McvFM/fu6HfhJRhNjJPE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=E7pJGZtR09KjGgnu37rioagkGQYrofqsxpwDd1WZCkXtei7qox8spxPmbOBCrFAyf7X3Qq6LH223cXvEFhEhTjfl1cH7qdjZDpz31P7ZEB6SOnQ17cgBs4lTHM+Nfa8kkRuenNw3qzIvZr0cqMZL1PFsqpaundhns5YFIhdxduY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=X9fWsRwH; arc=pass smtp.client-ip=165.173.180.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="X9fWsRwH"
ARC-Seal: i=1; a=rsa-sha256; t=1790692060; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ldsP/RLJD8nl19EVItyT4bYblAFBFIOX07oNppxphzZqYGq40JO2K33mg2AtnQeJ45AQT1mlS20O7qr1byLt5TrKGHzUAU/h8e6z6Jmec04JsXLkJ/4cmoTs2jjXIrRU3Gmt1AOKPmjozQb94vOL3+ocMX6Ebg5f9SiLaY684ZY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790692060; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=yx24PhUBiZbSsgHhB7AVEx7YIp35K2EBHbfwiSXgi4Y=; 
	b=bTn2SJ1c3juhJhNXrH52q7NOBSG7JKOF3Y3ntEN5OlsKjBTjNxA48phvDy7RqXATlA1YTfB2liaNZ4Q9Y2wBdNSvinDrdsc2bSpgeLdXkKvil20gxl7GI+UtRTGBVvCWE6S33DphGHe/FR+mChsD/l9dBLn711LdLOIdjqPA8+Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790692060;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Cc:Cc:Subject:Subject:From:From:To:To:In-Reply-To:Reply-To;
	bh=yx24PhUBiZbSsgHhB7AVEx7YIp35K2EBHbfwiSXgi4Y=;
	b=X9fWsRwHlhdq8h1Bl6Hl4vuOWlNcmWmplgiyQ5isjVNr9HImmlFhLBmoiObdo0Vk
	0xQvGZrtK4/ieXZ+QS2K64WBxtfy44+UyGOpE3K6+P/ecpaU/QF9m7xjXfDTq7ywylL
	DN5dp1BTnooI0DAsyqCi6fsueRENdFiGgB7paQbU=
Received: by smtp.zohomail.com with SMTPS id 1790692058044679.6670001196361;
	Tue, 29 Sep 2026 07:27:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Sep 2026 22:27:30 +0800
Message-Id: <DLRVCRNJL9VN.1TYGQLOZZVTZA@pigmoral.tech>
Cc: "Stephen Boyd" <sboyd@kernel.org>, "Brian Masney"
 <bmasney+clk@redhat.com>, "Jerome Brunet" <jbrunet+clk@baylibre.com>,
 "Chen-Yu Tsai" <wens@kernel.org>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>, "Samuel Holland" <samuel@sholland.org>, "Andre
 Przywara" <andre.przywara@arm.com>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 7/8] clk: sunxi-ng: a733: Add bus clock gates
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Enzo Adriano" <enzo.adriano.code@gmail.com>, <junhui.liu@pigmoral.tech>
X-Mailer: aerc 0.22.0
References: <20260921-a733-clk-v4-0-9c184ebe9ac1@pigmoral.tech>
 <20260921-a733-clk-v4-7-9c184ebe9ac1@pigmoral.tech>
 <20260921200512.3179109-1-enzo.adriano.code@gmail.com>
 <DLLYUYMR3CZT.17I8APGBH9H8S@pigmoral.tech>
 <20260926020313.911537-1-enzo.adriano.code@gmail.com>
 <DLOXXXFCEB5G.15XI8896GM7B7@pigmoral.tech>
 <20260926210222.283703-1-enzo.adriano.code@gmail.com>
In-Reply-To: <20260926210222.283703-1-enzo.adriano.code@gmail.com>
X-ZohoMailClient: External

Hi Enzo,
Thank you for the detailed information.

On Sun Sep 27, 2026 at 5:02 AM CST, Enzo Adriano wrote:
> Hi Junhui,
>
> Attached are the exact minimal board DTS and SoC DTSI used for both runs,
> plus the configuration extracted from the tested Image and reproduction
> notes. I rebuilt the DTB from the recorded source and recovered config;
> it matches the tested 4497-byte DTB byte-for-byte (SHA-256):
>
>   4c7b762757392334e8b7ac525e60bf5757ec23b34efdcc949d2093c238b1ed16
>
> The support archive contains the two local integration/comparator diffs,
> the four A733 clock/reset headers, source history and short UART excerpts=
.
> Applying the 19 published patches and these local diffs to v7.3-rc1
> reproduces the tested source tree. This is the minimal diagnostic DT,
> not my newer DTS work; its fixed card supply is part of that test setup.
>
> Both the September 21 failing run and September 26 clk_ignore_unused run
> report identical firmware banners:
>
>   U-Boot 2018.07-12-boot-aw2501-gb2d229198b2-dirty
>   (Jan 06 2026 - 03:45:33 +0000) Allwinner Technology
>   BL31: v2.5(debug):5fc237a6a
>   BL31: Built : 09:05:28, Feb 26 2025

I have now successfully reproduced the issue using the same vendor boot
firmware version. The root cause is that the vendor U-Boot selects
pll-periph0-480M as the parent of the GIC clock. However, the current
Linux A733 CCU driver does not model the GIC clock, so the common clock
framework considers pll-periph0-480M unused and disables it during late
initialization. This stops the GIC and causes the system to hang.

I will model the GIC clock properly in the next version and mark it as
CLK_IS_CRITICAL. Although the GIC node can reference this clock in the
device tree, the generic GICv3 driver currently ignores the clock
property and therefore does not acquire or enable it.

>
> These tests used the vendor firmware already installed on the A7S;
> I did not build or flash U-Boot or TF-A for them. Unfortunately, I cannot
> establish the original installation/download image, the U-Boot dirty
> delta, or the BL31 source/build inputs. I also do not have verified hashe=
s
> of the installed firmware binaries. Earlier source-correlation records
> point to Radxa's downstream U-Boot, but the retained candidate build is
> a different revision and is not a reproducible source for this firmware.
>
> reproduce.txt includes the actual ext4load/booti commands and bootargs.
> In particular, I set the U-Boot environment variable drm_debug=3D1 as wel=
l
> as including it in bootargs. U-Boot reports FDT fixup errors and "update
> dts" before Linux, also on the successful run; the excerpts retain those
> messages. The DTB hash above describes the file loaded into RAM. I did
> not capture the final post-fixup tree passed to Linux, so I cannot yet
> rule out a firmware or DT-fixup difference from your A7A.

Thanks again for providing the exact test setup. It was essential for
identifying the difference between the mainline and vendor U-Boot
behavior.

>
> Assisted-by: Codex:gpt-6
>
> Regards,
> Enzo

--=20
Best regards,
Junhui Liu
