Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE361F2C23
	for <linux-clk@vger.kernel.org>; Fri, 27 Dec 2024 12:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735303616; cv=none; b=rByzCQC3pXzOauA0ul7zr1qjm+lpwA44YlPJ2vitWjKsWLhJksbwxkAjDQv3Oc1wj7aIIX/WDHj7Wpf65oqsLp7DSRLXAIEnDJUWCw6u17B5x2BRmmM1KnxIQKyTv7WEknmb3rJ5Zru9j+3KYhqsGq91VcW83vcij7FU7TRkGqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735303616; c=relaxed/simple;
	bh=2JXqeAkZqG7diPY6Q7AMWo+pkhWKh1TA679Zts4452w=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hkj86RRjxmetSiHB+QsDXFs4XKlc72F2WE7A6XMsFvHDnyFY1D8wMz1Fi/ED95juke9oshs1bc0TfWrNK7Zr5Q6ktyhHpYV/Wgnzv5cJN2LrC6Zda1Qm8Hw9H4rRDGuYImmjqSigGP3F8PE3DumPet1F89B/MYCmFc1+RA+DGoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g+Ap9hgm; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g+Ap9hgm"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-436202dd7f6so81992985e9.0
        for <linux-clk@vger.kernel.org>; Fri, 27 Dec 2024 04:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735303613; x=1735908413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UEnUZO9THp2QmJQH4wK4+VQx1HvXZnRH5UGZIBC6hS0=;
        b=g+Ap9hgmUhI1fEkvUpNcO65Ctx8BBq1Pbx2xP2UM0OcTTd4VDmh9cxrp4EntWiUpAE
         QqgkiRM+BuiRZ3M3KymdOXgdBMALja4VmKubx3mW7pfrNrDYvDLi89xzOkHCsCyi3SYP
         0NKZtsOvd6cciRsHcftIpqLqvr6ruAWgYCTKtMztT98fZFsxHkgAfjq03OPfShnzTQg2
         JUBFIuyqi2rq2DJQ4EPT71B17db/a14Gm9oIFOsaIbc+Z6SZICR2qnn6N07t7mHOWv3Y
         E9Muz/D4Ej+Ziye5ERmNYkCVk8Jk5EBEGNh6zj+Tk092jlDosGsEBUw070aZNhOvMD8u
         ImSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735303613; x=1735908413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UEnUZO9THp2QmJQH4wK4+VQx1HvXZnRH5UGZIBC6hS0=;
        b=Ha2J66v+GnHYJshbaJLjQK9Kpb0tQSOZsy4iRQABytdTSdGl7ry8Rg8Kgj+QZYuLXB
         KH0B207W7hifUbFkfRc5I8L//Dobp4FcfUs76zDyTfijGwEjB25i+aVOct65D1xOZklN
         thVoTHEJ5IIXS39bcWnKEt3UmGY1WH1NbkEBor+oWHD2tNxd6VP8q8m+xGbdMXc4z1FE
         kVMFaelxkpIYt3qZts1Ni3idzZA2fzmMg7T7gyJg/KWc5nAMB+KUx8JbdNAHTKZga1/v
         5tE/shPVznR2u6xI4c5+aIaQCQJd/yZLmb0ZcoJL7bBbR+bPTv1gXPwNuX/j/qYGnWIu
         KgoQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1gNVOWyhJiYpk+fn2fZzYwew/C110IzkqyCqahgida7yMn1Ogvq3+iOavIHXPFEtwrTJxUcjIyko=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRt7ADfXT5iZrSUgD4HVHgvz4h9UrSW0GVjBt3DA2w6/iZECy6
	FYPo0iCRXuxGmAkqQiGWcniTPgBEAJiEl16uQhXHQzo8FMm8KVHfRbrK3JO45K8=
X-Gm-Gg: ASbGncsOeWXQQ2MMnUQtjXAO4l8m86gMUQAWSl2T1GmZ6+4g9TTdRNhOu9l/IPZALwv
	epaFibr9Mq7j0vFv6Cbh4vGb3g8QItpUPXfi06WLcxVfUeGYIeoPVti+Lgcr97saTJomT6AkBYr
	96GHSAn6/vhjZYLBj+ZIa+eL7lx1kwEYeRYEvmX36r8jGIjiR2GoAT14BW/5sLd5tqDjWVdjwFO
	F9v8p2IxPG/N41Utal6vk1s0ypqR/Upra6FxpqlSRLcTwGbE08pHC5l
X-Google-Smtp-Source: AGHT+IGQZ8FD/ZdXOaKiLcZYnvRp9y+mIdk15+UQCdfKpIMmCj7iHw3rYG0INhv1ebbbbwyJxTknkA==
X-Received: by 2002:a05:600c:468f:b0:434:a815:2b5d with SMTP id 5b1f17b1804b1-43668b785ddmr206211385e9.24.1735303612885;
        Fri, 27 Dec 2024 04:46:52 -0800 (PST)
Received: from hackbox.lan ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b11495sm297172905e9.19.2024.12.27.04.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 04:46:52 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengfei Li <pengfei.li_1@nxp.com>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: Re: [PATCH V2] clk: imx: Apply some clks only for i.MX93
Date: Fri, 27 Dec 2024 14:46:01 +0200
Message-Id: <173530350113.4140483.13428387054202142135.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241225001443.883131-1-peng.fan@oss.nxp.com>
References: <20241225001443.883131-1-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 25 Dec 2024 08:14:43 +0800, Peng Fan (OSS) wrote:
> Enable the LVDS gate, MIPI DSI, PXP, FLEXIO and MU only for i.MX93,
> because i.MX91 does not support them.
> 
> Update enet clk entry format to align with others.
> 
> 

Applied, thanks!

[1/1] clk: imx: Apply some clks only for i.MX93
      commit: 48806be086360846bb308c5ee21fcab8405a3da7

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>
