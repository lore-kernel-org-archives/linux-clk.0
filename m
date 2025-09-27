Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2774C278158
	for <linux-clk@vger.kernel.org>; Sat, 27 Sep 2025 11:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758970997; cv=none; b=qwL7hGVdRkKmRoN8p9MAhlVx8FWHFZ3DUjrX88zpy//hVrp6LHhECRHdN5YLQLzlUH26jTTeJDyL0ckRzzMXcdoKEIDca4jFHwnRO70eJ9ehpp60NDlH9AF+/JiLhg05+DKEP9mwWnncTuxUtvd/Nelo8kLSu9HdSX9cYN4n1d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758970997; c=relaxed/simple;
	bh=MEPk8mF0XWJhaPBW8X4rO7lqawwu25cscAs0P6vTG3s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=b2YWLxOLO9FrLf/UCLbRWqCPMFRhyJHlDcCnfg9ieVtr5GCE5i/rsuS6nmCb18qe1NJU+MRWQqUS55K5KMVJG9YFNbb0Ud8/AUkVApatPnX7KummnLh0jXvU58nN38LxXmfXpwgnYRcjPZERBSDMptIce/5Iqxq5n8o/LAuanrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B8DBl0JA; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B8DBl0JA"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-46b7bf21fceso23319705e9.3
        for <linux-clk@vger.kernel.org>; Sat, 27 Sep 2025 04:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758970994; x=1759575794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tkNWDYlAClljJacvPFHJT9/32vyeFE8E70qgHvwmkb8=;
        b=B8DBl0JAKft7KS0mBXk4ZY/ok6mJDWMh2p+a5mIpvq0gcIDr/nrOcKqyZZpb4sEwsn
         0JvCxISZgsr2Y6Com5U6VjlE8zGBC0ir58SwzAVi+kaOBqi0LcziH3q8uwCxP2kfY2jf
         oZ7zw1MKqyWSqsxH3xCjcxxgYRAiEEsYTDw9E1YXLmvMm3u+NRE7s3Xw4mrNsX3oBMD9
         YEVlT/0fJil/YiUuHHGONX2ymzrPDhHDbfn5rPwaPpLZxwx+TuBR2hFju6qEKe2uTsgY
         aCeRYI6sqWOcBkoVzVMeQh3k/9rZGfxTxFOETegROEUGv6k6i0PKaJEC58q2hRISmilt
         mzxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758970994; x=1759575794;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tkNWDYlAClljJacvPFHJT9/32vyeFE8E70qgHvwmkb8=;
        b=KoT5ZyH9ypdaML+YnaC+L2uQb5+n9esOOo85NV9KJ1DDGOAE7ewEvSbkzV5P2Quyfg
         +jpUehHdH/5ABiIw/XMnMThcUoXaB08QOEmujCKRSQ/7/wH8ApF/dxYkmVbyU/vZXGSb
         5TRVj7cpH3Ld5uSFE/E1Kw/bIlgXMspdKphBIOv1GN2E13zJUTJn8ZoWX9t0IsNVebAO
         vXsvh7SmWPNIZD5ZUBhBeBvqhl0U+K02tcqvdfG9FeDo2Ym26J+UadVRKfr/qpoEiX42
         xQooSzBXLGkNeyc2DmQzg7dvujnoiVFpa2MaYSDHRnLv9cL7hpdnf0ErDccJnRIE9HF/
         c5cw==
X-Forwarded-Encrypted: i=1; AJvYcCVtdIgnMdRO8wQIK8YMp07103DGvxFYTAFkbIm8BB/MYOnjGgWoXCVElDmA90pM7yjOENxV9P+AhMA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8hQrYrgBcRQCH/i6TmtMtjYo/mvrmvTg/h296mskQqGId7E4q
	dssA0zR02uLwJoBNdKXwrGwH98WFwwATvZVBRUI9PfQQZ1wSZju8DCND
X-Gm-Gg: ASbGncuEKHs0usm1rggEC70AF5nx8VsaRQu2aVXdThnU+9sPlb2PawpU88xelJMsQvi
	ggdikrR3Ib/DaxkQCi1gQ7hdWhEtIv6AlcTK2s7BwyGt5uZtJSkvamVJGujcJews6qXcdqouDJX
	2HjGKgujS0PYzVO4mUkMDKOjlKZ5TaJhweGP8kRC9k7fwUlnbCf7gHTgLyXZf/V2jDBOy6STnkZ
	NiWcXbbpP/c9cx6KYUTTw6ZgZDN7S48Ipskx0jtvV1INUxE+hySHVFysLEuue+Klsrd9DV81VZ1
	ul6PW3/tD/AXdPH0UfXgrwptS8I3jntH2gNaBwUQ8k5CvUwg/ozNZlMo4JCsHy2DYFQn3IvNb3W
	WgfbwTgB8WTu2OmEYwikRZGrYi46O2Iw+/xzGqwW5RgqH71c4vcQo/vbLXRzjzbMADVMrFbBdgd
	tK3GM42rRavDqpow==
X-Google-Smtp-Source: AGHT+IF79XdU3MiveCiJWHuSLef1NIT2fZqNrN2anDonGJumcYidxmAS11xssMvpXUUEBE8RsYnPGQ==
X-Received: by 2002:a05:600c:3e86:b0:46e:4784:cdf5 with SMTP id 5b1f17b1804b1-46e4784d03cmr11911565e9.15.1758970994270;
        Sat, 27 Sep 2025 04:03:14 -0700 (PDT)
Received: from Radijator.localdomain (93-140-175-232.adsl.net.t-com.hr. [93.140.175.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e33bf70b5sm106190035e9.21.2025.09.27.04.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Sep 2025 04:03:13 -0700 (PDT)
From: "=?utf-8?q?Duje_Mihanovi=C4=87?=" <dujemihanovic32@gmail.com>
X-Google-Original-From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Cc: David Wronek <david@mainlining.org>, Karel Balej <balejk@matfyz.cz>, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org
In-Reply-To: <20250913-pxa1908-genpd-v4-0-55e4cf32f619@dujemihanovic.xyz>
References: <20250913-pxa1908-genpd-v4-0-55e4cf32f619@dujemihanovic.xyz>
Subject: Re: (subset) [PATCH v4 0/4] Marvell PXA1908 power domains
Message-Id: <175897099249.11004.17270115916151643401.b4-ty@dujemihanovic.xyz>
Date: Sat, 27 Sep 2025 13:03:12 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2


On Sat, 13 Sep 2025 23:12:47 +0200, Duje Mihanović wrote:
> This series implements support for the power domains found in Marvell's
> PXA1908 SoC. The domains control power for the graphics, video and image
> processors along with the DSI PHY.
> 
> 

Applied, thanks!

[4/4] arm64: dts: marvell: pxa1908: Add power domains
      commit: 1ee5305033c227610c072f32c4ac8ba0adbd42bd

Best regards,
-- 
Duje Mihanović <duje@dujemihanovic.xyz>

