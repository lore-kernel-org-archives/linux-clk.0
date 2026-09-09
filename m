Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD95C442FD1
	for <linux-clk@vger.kernel.org>; Wed,  9 Sep 2026 13:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788960059; cv=none; b=Li9l9v1BV+xS9Ms/uSOdkat2DhFJpba2VMmmOopnPP869c9tV861UG1ZcRNqiruKFtFiQQEVyNoFrd6ZZW2+keC4/x+kavNV8mU6/WNXoggjqh9aPDXUPXYDW9+rDoppmInkptg2oNWfWKAOC2uTE8KfHpfd78nsVj1pG9i02Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788960059; c=relaxed/simple;
	bh=1rpYp9/x6QZBAeabDSXxOvoteEpsLsPbNU50Cm/Tks4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZcwZMpFI+n38oMp7P36Bv7M+FUUOVkxXxXaq8rkFyxYQ2EA4+M/evQy86eezXgHOb5kgaYHWwMQxOe3KINqktYf/d7KAa//qzkS5eWfVQLiZDbpI0PSxZPwbAmUZcG+m4GfjLLIVqTOydrjDXQyd2Cnnsg5Nfp3R9otnqGMRLQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iKiostL2; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iKiostL2"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49b96837ca3so46070555e9.3
        for <linux-clk@vger.kernel.org>; Wed, 09 Sep 2026 06:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788960055; x=1789564855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xqcFgIRraimIxFzTBpazVCLFmRgJ8bu+hLdgiYiQiYQ=;
        b=iKiostL2iShBz5U7B+fqlBWmvWLfjAN0C5KJIomug0nbS/uaSDFEcv79uDjBQVqYBZ
         inGJr6bEINe4aOUmERVgS6HZxY8ixN1G/9LJKFytADUt+FNct3Ej2/ct2cQQm2TJYPi3
         eVl745xC9ICVSAKFfJPXu1YcQVew48NYH1XJfeYpeLtDAJXHsPvHrr7CaQ1GXCfO4QEQ
         zqJxCqiASVHG7P5XLC9XTWBtNmbxIoheEkip9mWlQFAY/1J3UfN92Ex57lMNPw7HxJ/2
         9nTVkflibCDZMmOnG/RW1PEhOA1/7hkCOG1Xnli6KNk1Uva/oHkOxMV63gIicRGoLk3f
         GCQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788960055; x=1789564855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xqcFgIRraimIxFzTBpazVCLFmRgJ8bu+hLdgiYiQiYQ=;
        b=mUQB82aKNkO3+knA3BDSLYSw6VcrGEGZcxXWRT9wp2JWueLtkVO/Pwhov2TWpq9Fow
         StUuIt0D+f+VJA3dnKxW2ktXZpaIH68Z2z90VH1JK9Yg1sg8hVBqIgtSUHHbPO7GtAvY
         Cu1eJ+69GFXnaKOj4mIMIjviKNW9cvid92z+QfMUSayWH/pNOZVh/tBQC/WFSE8uOTl1
         R7wTU47OOrYepyknC2GUnxWzi/falo5vPz9NQ4YE1Cujv+vDyV8ib/21ARMsnattRQj5
         Aga3NA+9zz6YPl5cEq1rjhiE0arAlbJ8E8WHMsNnBUIUEaoG38qVKH65gMZNF2MPIDWK
         ViHg==
X-Forwarded-Encrypted: i=1; AKwUvBx4GiTdN+FW6cpDmuwL2XxNVERXpMHk4jMz9rPtsY1LDwaBR7JKqjLeozIW5hvTFLni7zr/HRoahHg=@vger.kernel.org
X-Gm-Message-State: AFuF++l1kH+WtUbxsVEwI96yCUOeCpoAEHqaPZENc0VgdjHcAh7x24pZ
	VJFy/B4l6noPedx9r22R+hgzOLI5zop6pwvKGHgxSkh1PXeZcDI8I7IL
X-Gm-Gg: AYBFou1sMODGVEfcFnzlgEBwl73SQJVoACtdTUYyoCth25TJPqbwu9frnMx3tLEKSVG
	WhxKsFR0vPvaNN/uEgUkbRMuk21xJPkfdBtpZ1wDxbKfhsS1s5wbWxPEk+ardVqB+4B25i8TMor
	7ISwi+JZmKueu4znM2MoJ6Nl+0XQv+3qZrXJqTjEUNMWPoAd0QTx8oHt1wDEmDXrnlfUfS9REyD
	n6h4WhOD4VEIUbexyVlIJdMnFCLNqRJ+sp0cRh0WeeqL/45ZDwUe7vtRHQJ9bP0snGNchIqEftq
	qBs3xSyhCSkh02LAEFDgpSxiwK7mD7ZTkOEz3d4CwkjWev3+m68bU9XzKt0EwehLIq/w623Xvp0
	0SWNz0rpwr1sDEMdKB16zd++CMP3Wy1M+elmfQUOvJcYLMBi4NYvH452KJdtgEdaIQOn8JVjPln
	t25PY0oyYBSLOTVU1/uhOtjfaT0CH2BjZg2gu8xnfrG5zQevoKX5cIR1Me9VVMGlUWXIMRaGp7v
	oM1mA==
X-Received: by 2002:a05:600c:3ba5:b0:49c:dada:f581 with SMTP id 5b1f17b1804b1-49cf7f39c8bmr434366595e9.0.1788960054671;
        Wed, 09 Sep 2026 06:20:54 -0700 (PDT)
Received: from VivoBook-ASUS-X712UA-M712UA.lan ([2a00:f44:c51:e108:176f:2adf:3ca6:dc52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d1e002d25sm93156835e9.1.2026.09.09.06.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 06:20:53 -0700 (PDT)
From: Stanislaw Pal <kuncy7@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Jie Luo <jie.luo@oss.qualcomm.com>
Cc: Mieczyslaw Nalewaj <namiltd@yahoo.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Georg Seema <georgseema@gmail.com>,
	Brian Masney <bmasney@redhat.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: ipq-cmn-pll: keep the CMN block bus clocks enabled
Date: Wed,  9 Sep 2026 15:20:49 +0200
Message-ID: <20260909132049.37611-1-kuncy7@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <b58e3f64-1a5c-4db4-a51b-7138fb3609da@oss.qualcomm.com>
References: <b58e3f64-1a5c-4db4-a51b-7138fb3609da@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 9/9/26 2:12 PM, Konrad Dybcio wrote:
> Is it only the UNIPHY consuming the 50 MHz one?
>
> What consumes the XO clock? What consumes the sleep clock?

Nothing in Linux consumes any of the three today.

grep -rn '&cmn_pll' arch/arm64/boot/dts/qcom/ on v6.18 gives, in full:

  ipq5018.dtsi:258:  assigned-clocks = <&cmn_pll IPQ5018_CMN_PLL_CLK>;
  ipq5424.dtsi:288:  assigned-clocks = <&cmn_pll IPQ5424_CMN_PLL_CLK>;
  ipq9574.dtsi:359:  assigned-clocks = <&cmn_pll CMN_PLL_CLK>;
  ipq9574.dtsi:1253:                   <&cmn_pll NSS_1200MHZ_CLK>,
  ipq9574.dtsi:1254:                   <&cmn_pll PPE_353MHZ_CLK>,

The first three are the provider setting its own VCO rate. The only
real consumer anywhere is the IPQ9574 NSS clock controller. No device
tree in the tree references XO_24MHZ_CLK or SLEEP_32KHZ_CLK, on any
SoC - and of the five compatibles the driver carries, only ipq5018,
ipq5424 and ipq9574 have a cmn_pll node in mainline at all.

On IPQ5018 specifically:

 - eth-50mhz: Jie is right that the UNIPHY takes it, and it will become
   a clk_get() consumer once IPQ5018 UNIPHY/PCS support lands. The node
   in the pending work has

	clocks = <&gcc GCC_UNIPHY_AHB_CLK>, <&gcc GCC_UNIPHY_SYS_CLK>,
		 <&gcc GCC_UNIPHY_RX_CLK>, <&gcc GCC_UNIPHY_TX_CLK>,
		 <&cmn_pll IPQ5018_ETH_50MHZ_CLK>;
	clock-names = "ahb", "sys", "port5_rx", "port5_tx", "ref";

   In mainline there is no such node yet - the only "uniphy" nodes on
   IPQ5018 are the two PCIe PHYs - so that 50 MHz path exists in
   silicon with nothing holding a handle on it from Linux.

 - xo-24mhz and sleep-32khz: I know of no consumer, in tree or out.
   Worth noting these are not what the rest of the SoC runs on: the
   platform's 24 MHz XO and 32 kHz sleep clock come from the board
   oscillators described separately in ipq5018.dtsi (xo_clk ->
   ref_96mhz_clk -> xo_board_clk, and sleep_clk), not from the CMN
   block. The CMN outputs at the same nominal rates look like
   re-exports for hard-wired internal use.

I would rather this did not decide the patch, though, because the
failure it fixes is not a later register access to the CMN block.
Mieczyslaw's summary in the v4 thread put it that way; the mechanism I
measured is narrower, and it is what the v4 commit message describes:

 - gating those same two clocks on an idle, fully booted GL-B3000
   (runtime PM autosuspend, gate landing ~75 s after probe) is
   harmless - runtime_status "suspended", both radios still serving
   clients;
 - with UNIPHY0 disabled in the device tree, so that no uniphy driver
   exists in that boot at all, the board still dies in 6 of 7 boots;
 - stretching the end of probe by 15 ms, or by a full 2 s, still ends
   in a watchdog reset, 8 of 8 boots each.

So what hangs the SoC is the gate transition landing amid early-boot
bus activity, not any consumer's access afterwards. That is also why
no consumer-side scheme can help: the window is between the CMN PLL
probe returning and the first clk_get() by anybody, whichever consumer
eventually turns up.

Thanks for the Ack on v4.

Best regards,
Stanislaw
