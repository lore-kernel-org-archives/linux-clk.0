Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B4C3AE1B9
	for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 06:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774505112; cv=none; b=lU1kyt/KreLNUnOLEgaomu8zUyf3u0oT3AuDvMHuodoouh4jCBNS1DIP6Gos1SABmGkBhNSPYxlv4LE4ulJha7CFIAid5Al3wevQyHYhLITx97IzaafWAY0vDsnskJNV+wVfdjroaXxiJlBeUkSNSWHn2nlnvqGXF4WUOdyFxJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774505112; c=relaxed/simple;
	bh=qNFpsTzbZWFFsE9iGPhAqreCH10Wgsp1S3A+JKsN4UE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DHiJyuCqUUbNg63b3GQVT4AxXzw3qH7z5dNqhM3P+jCstir5Wb86v3SQSmLptwYkYZVjHRe5GNdzXJxoi0Es1ag2NoZnfwdZNlq/vl+EPa24APX1F4cIqS820/E8SKpoLtG23fAgBaC3hGEtuBFUy/+v3dWMHqUCQNy2nX2M/Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gBvfFiws; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gBvfFiws"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c7358a7a8d1so462536a12.3
        for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 23:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774505111; x=1775109911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=slX6PVa4cy3hgS68Dza9/DJkjU5Sh4E3O/3Ms43H/6g=;
        b=gBvfFiws1D7nrr0969LU2ttOkRDtgN0BXXAg7NjMb1jnWTiv7SwpdNrVptgI4QHkeh
         fgXQGXYgQVfLMCCRhsLdAiuvxtTmShQcFv4+owmBUkMnsEGItbmc/mkaquLahDJRLVxr
         dtoMNXsr2B0gDHbUDBbfUDN0mpW1+EbSMOwz0IPY4uxEoOT6VfbhS2r2Q2oP5QuTjy/d
         mwCqrhgFCg/bEpBlYpQqBqIQodsTnZk26HO+gvj4rpKqSanmg8wWJI0Dm9xL0I+hnkEd
         VL2NVdMiPuNiK87ljI1RcbEaJLQP9eBZf8G1Ly5ndrbLtjw0cEY8D9fwsXlwrGHEF861
         atnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774505111; x=1775109911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=slX6PVa4cy3hgS68Dza9/DJkjU5Sh4E3O/3Ms43H/6g=;
        b=VEUqEj+2i3L7mg/j5cvUzxmoOpLF/iI1A/HFZf7zh+ShXFFsfl0Y5exulZaV9KfD/n
         9gNhWo3dwSuzXN5t6pdLQoHHGIzbH2WlS7o8/Oh/1otoCOjTwMNO9bTMYUta7fLBwEvn
         UTUGQJI43I6zLnIatogcf0OBaXvrx/UJXMNQQzUQT65ojvL9FzdWVUsaC4yt3WmUjTxg
         fQ3V6typef7uCqPAKW23DYALm6W5GiTiWHQUQ7pjYMIBCdEPFA1QaZRcGuVAvNSz/ouh
         fdHbvMeWKY9UAzqS3BFzxuzEwvFmoSts4wjJTP2fiGlLezuyvIBsq1BIGQx04f9nBphU
         ddag==
X-Forwarded-Encrypted: i=1; AJvYcCVuHo67DJPb0sfAel3NohMRXGA0XtFLaAiDEXVBAfzduWG+JI1mC4nHsoO+baABIbxxyPFi1AT9X6A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWzFIOZ+zrKhfWYhY46kuIUrvr8ehPUQiagg7m6Zz6guWXUHnu
	CO0OpRbyspEIBlm6q6OBBxdbjh63ei3j3lOOnII/xpK/zB2Qg3ItOvBZ
X-Gm-Gg: ATEYQzxXlE7c2U+mOqN+MzHnXMljC4saBwcT5HYctMCKXNZqDDN48KaL31ivK13TpCx
	kbcaEU7kg9UNICAlRfCpGInYAKhRBDspC/5WvYgyh4xf7OvY6bOMte85pl9Bay0pBG35FOFbZnu
	VncY6gbupFzjpdqKdnlmMEvFbKMckZahaPg8TEO7wNBleryXrEtrZXrarFbKp+BnVJu92JLeP9J
	yeDvN3NaA8CaqdByrMGxQwiWO5QfdvmIr5xGuFJCWs2XLBDpBSc6B6XYjgMEG8XlDx8ihaMHSLN
	GI9pxXBSL57hGsh5AUxMxpzx1lzRe0Hj3CbJ+wI1QOy/V7s50ggsUB+MvuuL7wAmnLVvEeK1hNB
	jD0OQzbKnP+k2Sd/hGffBEXvOYfNm7pRO9WuqacG0v5BrA4Zz0xox65Z1a72HS0l7miyPHQoXht
	IjtMWUAURHOSYESkXH/Tnf
X-Received: by 2002:a17:903:2f4f:b0:2b0:41eb:165e with SMTP id d9443c01a7336-2b0b0ac5e1cmr75649075ad.38.1774505110564;
        Wed, 25 Mar 2026 23:05:10 -0700 (PDT)
Received: from ArchLinux ([43.226.30.138])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2b0bc7afad1sm21051385ad.31.2026.03.25.23.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 23:05:10 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
To: Sean Young <sean@mess.org>
Cc: Biswapriyo Nath <nathbappai@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Martin Botka <martin.botka@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-clk@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 0/7] Add vibrator, IR transmitter and USB-C handling in xiaomi-ginkgo
Date: Thu, 26 Mar 2026 06:03:58 +0000
Message-ID: <20260326060402.16021-1-nathbappai@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <acRdOmHKQmBp-RSd@gofer.mess.org>
References: 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 25 Mar 2026 22:10:02 +0000 Sean Young <sean@mess.org> wrote:

> On Wed, Mar 25, 2026 at 06:07:23PM +0000, Biswapriyo Nath wrote:
> > This patch series add support for various components in Xiaomi Redmi
> > Note 8.
> > 
> > Most notably:
> > - IR transmitter
> 
> For the IR stuff:
> 
> Signed-off-by: Sean Young <sean@mess.org>

Hi, thank you for the review. Could you please add the trailer to the
specific patch. Otherwise, b4 adds the trailer to all patches. Also,
do you mean Reviewed-by or Acked-by tag instead of SoB?

Thanks.
