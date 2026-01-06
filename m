Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73DA25DB0D
	for <linux-clk@vger.kernel.org>; Tue,  6 Jan 2026 14:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767709126; cv=none; b=QIMklRblLWqKZH9r4gSsSEq2dLCEGOLDuM4oH/NarddxiN2LbCfEMTUeYyxK/OHIuJQ4L6HaZATr3Gle2nRPDjoJ5ThTBu1gjgg9A9qmRszIFGmsfQ++ZHbc1yrQeqGRzoD+B0PUv/8WTOQAzyZJA+1QwxFERvhhw3aeYVElaLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767709126; c=relaxed/simple;
	bh=wn8RNdj2smZtv9veOt/ubSRx5qISALrPSQch/va4bwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iuaQXqsSvyYaQWB3T8gh93eXCYeEKrsy52Ora3WnQmg2DNK7Q/eFfUSIaMNV6/liwPTReFJU52kJejXzHoDye54W5qSpv06ZS8W2HOaebcSTLV5rzhwiP6YZjgjGqtAkWFeZdgnKBojIeebikxf2/edGaI4H7FwMI6YGn2IJSuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=n1gWr7rL; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="n1gWr7rL"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47d3ffa6720so10070805e9.0
        for <linux-clk@vger.kernel.org>; Tue, 06 Jan 2026 06:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1767709120; x=1768313920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PDyomPMwSX0nUznUeSpIGPTPKXqo/Pa069JTwjCcRpo=;
        b=n1gWr7rLfgPEuw38idGDWtgZKaCu7yPe8vExM/MibOtypgupkoBVOzVztWz5lVy96R
         EOCIwO5enXWkeLbUK6CzeAc+IUOtHQQG03KgtF9Hv7yrLzJ2iRdMeJdVXntupSLjZxwi
         cw6ImBi/K7GHkjn2OnopT+ZArjS1Y6FE0+L6KizlxWT/P3UgoXHTNkd/anwG316vV+BY
         PdNODd3xNmaAnoIbMA8ukh5OqxKmAjQHr+lJQcGfCjaJngfzzD50xep2NfDdEkwMj6SB
         1vVW0kDXD3tIrkiEyciWZS+ehM0yERW89h+/q7inxSOts1RFDkZlvHrb2mZHEmwhj3Hn
         vNZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767709120; x=1768313920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PDyomPMwSX0nUznUeSpIGPTPKXqo/Pa069JTwjCcRpo=;
        b=ODhp+VPerFv74MSJRD9CJxNcX5tl99yNBkTowuUOMCBl5/UGSxRtac8U+lHqRSJZYd
         zVJYweDHcHRVBdrmgsrwrlNrGjRVaUx/yLGuKxtf7cowdNeiJR42tL7c2NWFbhLw6nrJ
         /hiapMus4wdUELomTU8pMEH49vUNCB1JAQQbun51I8Ljnj7A8J8ennj0VwVjk7bt3pZB
         wiFtBSLwXWwPr22WCy+0GZoFVGMhbl09Ml66HE8oR/2gwBSuGnVcBcOZTKeS0BR8dhqR
         hdSlJbpX2ot4JHFYYGe/s43Cw6qQxLJKbCPHmU4fNVM+1OAXVwGx5FurgqeCre+USOwB
         LZ7g==
X-Forwarded-Encrypted: i=1; AJvYcCXbe01IhMsKfhDH3H15frDJlhu6n0YASpPBCZOklzwCLnouJVk73zLMqqQ49k9M1Fvpx63PwTwP690=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1ZcoVjIKbczb/8nZ0uha5S/slxBRN3WS13P4xMVdIMA58mMeM
	ews6tyVQcKYaqtvoVd3nUtfVEHnzhqmF5WgU/9Tbj37v6wpbsGodd3F7yoy7dCE0bww=
X-Gm-Gg: AY/fxX6oSOJoKJm1ri8o/jSLrHvtPxW/mz+iAwXht0bQagpXWTHaiC0WDgrc2I9Zjn0
	1vxU+S3+8ZVF4Hqn8RXizVroh9EPzAGSwI84mxzztGeXY2WQTaliErjTIUOyu2sCWPIIGh364sD
	rW+qg5qLuhVuA0Ee3F+LFEcPeEvP+h3f37AV+zR+Kl39Zs17EfJaUout2wqSgogORdjCetUQhKR
	Lr8EzuUa81S0VWm5HrM7moDshfBB/Et8g89+bzKqmXmlNQIy+28N+bKB008KOjI1Xhup3QSMhPS
	Y0KVA40AkuiQ6yScMZvJJdmnX7BGFoph7rZVkNur8Zj2VhEmQt1A6apLZwXzANmNomiQJ2/8j1y
	K2LMlD+aoLxg7XU9UkUPaBHfAiSpKNvpeSa8+eAKj+/Z32oEB8kPspwV+pRr4syTAQn86APHkqT
	Ay5DETKPlelDVF9YvdKaOE
X-Google-Smtp-Source: AGHT+IG4RoI4YqTRfLqMtHqERY+dKFavuI8R+zT2rhNFCJf6Ipd0EyH0ZjVfMEfxdwK/NE7/Y+RH/w==
X-Received: by 2002:a05:600c:1d8c:b0:46e:4b79:551 with SMTP id 5b1f17b1804b1-47d7f0a324emr36773525e9.31.1767709120058;
        Tue, 06 Jan 2026 06:18:40 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:e488:b673:7409:68d0])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47d7f7035f2sm43558785e9.12.2026.01.06.06.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 06:18:39 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: linux-amlogic@lists.infradead.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jian.hu@amlogic.com
Subject: Re: [PATCH v1 0/3] clk: meson: small fixes for HDMI PLL OD
Date: Tue,  6 Jan 2026 15:18:23 +0100
Message-ID: <176770907988.1004563.13571465521875416136.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260105204710.447779-1-martin.blumenstingl@googlemail.com>
References: <20260105204710.447779-1-martin.blumenstingl@googlemail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Applied to clk-meson (clk-meson-next), thanks!

[1/3] clk: meson: gxbb: Limit the HDMI PLL OD to /4 on GXL/GXM SoCs
      https://github.com/BayLibre/clk-meson/commit/5b1a43950fd3
[2/3] clk: meson: g12a: Limit the HDMI PLL OD to /4
      https://github.com/BayLibre/clk-meson/commit/7aa6c24697ef
[3/3] clk: meson: gxbb: use the existing HHI_HDMI_PLL_CNTL3 macro
      https://github.com/BayLibre/clk-meson/commit/2fe1ef40b58c

Best regards,
--
Jerome
