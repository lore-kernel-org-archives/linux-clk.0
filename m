Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B194047DD7A
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 08:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784709159; cv=none; b=EKRzKkZ577Uk6ZtJ1bABswdKcQt8ywkfdTfc/K4qaAvj24ONFpWGwTGu/I+cMhc7izs7VJuKzBYeI68UHufCCrbIpJLY1o0FB9/0zE/gpOc9nt4Q6kcQ9d6xYL9iLJPHuSmvciHLCIktonC99cHLvacdItIczSMMUs/y6fHklgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784709159; c=relaxed/simple;
	bh=2pDPxz4BBjkygmVMFu2wNpWzV+w13cH0odSwuzZ7rpU=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=XcXe2BioigohDZIK0h8PJyMraVIIFyUnpv7+hSbX8i//VPuCLyHzU/vPG3U62cVUP9jgyTgSFyahDzvKMNCLGpQMt83Cz9uAQjqLU2bI+LLMMxoMYFf3EmBQScSL8vnbQqMAGVjKhVZkALRj6smtTawtniT3kBYLilwakHZATKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=lQKd8mOE; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="lQKd8mOE"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-495437bb891so48758645e9.1
        for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 01:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784709153; x=1785313953; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aQsP0j1/0EYXYh+YUV+ryW7tyWD+TDQPPxW4bqOogig=;
        b=lQKd8mOEW1qOGw7DxpsGsg4x1lYiVLdAUtapsRM+g4ARxZyRiNO+pZ8Pyb5cP14smx
         7YpbhskMk4avRYc3E8lypntTPPkBcBZqemJv4Ar5Yx4Hw3qCYwkNb49C/z8oz1WcMuZI
         AyQ2d2KkhlFyehWYywIZE6VCEeQBxDlRwgtzakUqSQpgJUM7dYD4Dom2t2vB9tsVxU+r
         iifxzmH1ELaObqBrewGKnTYgPIKesqpCR6YoFCgAW40LV+JhlkdRNi3ivuiPR2ODBLwK
         cpMZ+37Bz3iaEkIt+1zO/2XOVCIg4bI4qeScoBsnTRIAIBOnZMhX7fYuFrbfVurx+T2v
         Q6kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784709153; x=1785313953;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aQsP0j1/0EYXYh+YUV+ryW7tyWD+TDQPPxW4bqOogig=;
        b=JbBbtsuUQHJ0XDQDmK0zyxBI0V4qNhOib52FamHKvrYbLWwqrGnrB+U/zvkWKGO3aP
         3OOrlPOiSv7bA3elJtUl8ab2B4hnruRzr+uYS568IJOGpUJpt+rM2uqtokZL85TCm9nU
         w4QetXA8Ou9nnjGg9D/+cjmU+xpOn9DZddiolAPWQqDmgsJD/ks/4paUY3FNM9SyL1pC
         Iu7LNTRR3b/8rSFdKDaC9uUmN7dLxjagP7FIy005owu0Ns8HVsnnaYv+PDrxbe64WD9R
         hkjTnMa9knelIWggdt3o39ELbjnGIZAGWZm0SIaXs3VmJ5k56ghJKXZ07gHjAnhaQXk+
         qKqg==
X-Forwarded-Encrypted: i=1; AHgh+RrTXabHb1kFnTqiMlErKp8Q196OmDDoD8MstsYU7GeCRJ8ZnV7j28gb12ciZSlqxN3IMRGuYR+nuqg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXfwP2aPBqVCCPlC4QBcQ0NCSmrd9QjTz/9vZeXKVgHOFuwHB7
	Dcn51jZ+5a7utDhr3Mc2z25yRryfrCeaqH+A7r2kuobr8rWomR2gtvlZULEMvMRacA8=
X-Gm-Gg: AR+sD1314pnxx1FaFLDz53aCDSWeEBdeWvAcJbst8NRXFMX3+OGJEnDGtyFWAT96XFy
	G5tDCh8d8SS1UpPLyCXcq5n6ulqv/xElHzKCkkJXTW/Q7ZjkS0DqSJxbMns5hfIy7Vf36K3EsUH
	pULcepHnkGgkUyTQ2cAXapkVIlPXvATUSVCpiys0pbTxNoz0+9V+KHTjSHrMzIUBVgi3vDan9g2
	hxC0ElAtPdiQVmzE45kSXVlevq2CiTqYLR5sd/ZzptFSUhdjIOn+mZkwEhnj9smLhOEvumqdSvR
	7pASOJQ4agjlTJseea8eCexZR8obCDPdGnAgEOOZjF4EE+0vV2iY84kxdVNpxP5hpevMSPNBrZ8
	zdj+WmJJzmFRTHMBf6k3psAtezU4xE0UHtKmpR1SZVVzCcQGZMMQ79NKojWiAontenUz5pGAukK
	uy1nBdPi6I1g==
X-Received: by 2002:a05:600c:3510:b0:493:b4a3:5ab0 with SMTP id 5b1f17b1804b1-4956a50fd4cmr30832715e9.13.1784709152690;
        Wed, 22 Jul 2026 01:32:32 -0700 (PDT)
Received: from [192.168.5.218] ([88.127.185.231])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4956a508aa6sm55190175e9.7.2026.07.22.01.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 01:32:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 4/6] clk: qcom: Add Nord display clock controller
 support
From: Alexandre Mergnat <amergnat@baylibre.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Ajit Pandey <ajit.pandey@oss.qualcomm.com>, 
 Imran Shaik <imran.shaik@oss.qualcomm.com>, 
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260721-nords_mm_v1-v2-4-17e5a445a512@oss.qualcomm.com>
References: <20260721-nords_mm_v1-v2-0-17e5a445a512@oss.qualcomm.com>
 <20260721-nords_mm_v1-v2-4-17e5a445a512@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 10:32:21 +0200
Message-Id: <178470914171.3016846.549735580156854018.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1737; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=2pDPxz4BBjkygmVMFu2wNpWzV+w13cH0odSwuzZ7rpU=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBqYIAcQrcCpDfGduJgYL+AuRNm84j2tgSKw3RCl
 RV5F0qaPsWJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCamCAHAAKCRArRkmdfjHU
 RZshEACwItNx4iok2MynvswFDc7JGIXaaPk2klg/0knL/MZrWQStzM90G2YPLo7zETPqO+dIEts
 iA6Gg8bWYHjF0oMB+Unf7o5dFeL0GW9MA1C7Mk+Lkp3K7St/ZJfx6QivcSXryO1f5u8PNlXHOSW
 f3/XfR99m0mFgvCgu+tG+1z4LkLawCxjTpH+6c8LWbt1J877r1w6nnO8RePR9QfeSeMBx3sW0fu
 VvvwvUwKcKans9HTMFIRcVBdowsXsJil6OfLUlwgOjc4c5sULU/DRPojyjafnaT9508t44HgiiN
 cwqqu+AVW4fWHUv7PIoeYgyIoaP8pK1KabSbpQsD55ZlFg6HRgDswpDBATr4EKmwRLEnytnEmQw
 Xx8Qtsandw+4z+4QU3B3dBiyPH51vh/QQ1hyvEzJIOuDuRoNKr2UMvfq5vCiYVp+9uMd5xoqjCq
 mdyLt5sn4rFmOxhPuYhJ1n2X36ACnArOE8GTpCOseH4ggAo3p3wl/P6FtfeS2YyD7+AIgNeHYL/
 BYO9AZR5b+9jVH/P3W0u1e22rdsgvNT9qU3FRrkvOjXAMTy5jiPvDJyER108H/EvB1+QripxZaV
 g8gqZQUk5Oc4RnECoPqTaPwgTpZ5IDuC3eLBdL8TeaoTKrtiza3DobYBrJtJU5eXgDGPebsUskQ
 WkjiivOxmDTr/5Q==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

On Tue, 21 Jul 2026 12:37:19 +0530, Taniya Das <taniya.das@oss.qualcomm.com> wrote:

Hi Taniya Das,

>
> diff --git a/drivers/clk/qcom/dispcc0-nord.c b/drivers/clk/qcom/dispcc0-nord.c
> new file mode 100644
> index 000000000000..6d9c74ffe9a1
> --- /dev/null
> +++ b/drivers/clk/qcom/dispcc0-nord.c
> @@ -0,0 +1,2004 @@
> [ ... skip 1944 lines ... ]
> +	&mdss_0_disp_cc_pll3,
> +};
> +
> +static const u32 disp_cc_0_nord_critical_cbcrs[] = {
> +	0xc00c, /* MDSS_DISP_CC_AHB_CLK */
> +	0xc008, /* MDSS_DISP_CC_VSYNC_CLK */

These two comments look mislabeled: offsets 0xc00c/0xc008 are the RSCC AHB/VSYNC
clocks (cf. disp_cc_mdss_rscc_ahb_clk @0xc00c and disp_cc_mdss_rscc_vsync_clk @0xc008
in dispcc-sm8550.c / dispcc-milos.c), whereas the plain AHB/VSYNC branches in this
file are at 0x80c0 / 0x8030. dispcc1-nord.c labels these same offsets as RSCC.
Can you double check and update them to MDSS_DISP_CC_RSCC_AHB_CLK and
MDSS_DISP_CC_RSCC_VSYNC_CLK ?
The offsets looks correct, only the comments differ.

>
> diff --git a/drivers/clk/qcom/dispcc1-nord.c b/drivers/clk/qcom/dispcc1-nord.c
> new file mode 100644
> index 000000000000..6b4efa735b9e
> --- /dev/null
> +++ b/drivers/clk/qcom/dispcc1-nord.c
> @@ -0,0 +1,2004 @@
> [ ... skip 1944 lines ... ]
> +	&mdss_1_disp_cc_pll3,
> +};
> +
> +static const u32 disp_cc_1_nord_critical_cbcrs[] = {
> +	0xc00c, /* MDSS_DISP_CC_RSCC_AHB_CLK */
> +	0xc008, /* MDSS_DISP_CC_RSCC_VSYNC CLK */

MDSS_DISP_CC_RSCC_VSYNC_CLK to match the other entries.

Minor: "MDSS_DISP_CC_RSCC_VSYNC CLK" is missing an underscore, should be

Minor: "MDSS_DISP_CC_RSCC_VSYNC CLK" is missing an underscore, should be

-- 
Alexandre Mergnat <amergnat@baylibre.com>
