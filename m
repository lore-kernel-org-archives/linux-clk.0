Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BAD326E146
	for <linux-clk@vger.kernel.org>; Tue, 11 Nov 2025 15:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762875976; cv=none; b=JQIxCbGsVj/WT7w7+kBwthjUchrbUw5bYeXmiKK4gDZzMn0qez/sg4SQ4N1IQ3y9B/9XK/kykB4AuKTL13yE/kDjgUY8uHFxgPAozdtRhxNrGN8LnsImWm25kjfxmAiN6/oRmArtQuwFLDT0ur9RnNm+qkVSCqJekoofWk2V2kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762875976; c=relaxed/simple;
	bh=taKJtLEON1PLVeXA9coj88ZKEsXEwkJfRELQNcAISPw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p7iZpH3DNRL46+oNzWYiUm2sdVUTqKGxBd2Vy6ELJeXNc7hNJaaRpa7/i9my0u29eXU2jtQCVBfusGfFANv1hry3GXXcO5G/eLJ8RNk526lh6PkzcbpBFn6jCznAip++pfEvbP1jxRf2t4ZiqVmN+m59OMZwQEV9UgB01wE2OhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=No4O4oX6; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="No4O4oX6"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42b312a08a2so2393882f8f.1
        for <linux-clk@vger.kernel.org>; Tue, 11 Nov 2025 07:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762875973; x=1763480773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LjeAFk0NqeSfnvCC/Kbape3/pyr7YeM9MWnFnGW40z0=;
        b=No4O4oX6VjETSUyVcZwE9BL1U9kI1MvLNanTdlzNFmeM7NOKVqpQM+Qua3vq66ZUoH
         Kn36Thaur9pX+rQVI+R8hErqwR57OkUVaFnvKP2Ge6YJpZT8ZC4QGBUyhYBhOtRm7Cvq
         d9NvBBlKz0VyYddH0Hcdp4xCX/KzhTQNGVtgFxjDDhCLibFK59YA+nSMbe9VzsjPiTJv
         pmzVJDgYTbMehSpcPs0ENl0nqx/YD7qxIo5DpBkCGFjkC1lLAfAO6qZH+kP/mAtGKagZ
         vHPmy9XempCd7tNz7B3ivd6xvSLRXGblubHIN4DPpKQv1inVPgYrzuNbbds6hRnQCZ6j
         4Yuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762875973; x=1763480773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LjeAFk0NqeSfnvCC/Kbape3/pyr7YeM9MWnFnGW40z0=;
        b=e+G4CEdEDWjpGNKiiMXT5Daa5dAymAcAiaD4RRfzdWIFFH8+g0Psuz5CSmQMJZnzoM
         G082kO3oHZvw6AJ78iov2o6fd3IpeE+d/Hw37OLjQnOWgwGsW3xO+3QGpwpx7mTpScEt
         s5eFr9h80a3BdyUqz3aKZMSr4giZZ6MIMWfxQlMApVao/YVGqJxEA40gvPpHKtgJQH7Z
         gbBpVH7gRsAxrhDbAVrw6xPlayoxgHVxPaZk4d6jyf0qMNnW55v76OrU+UHomrwgftLj
         cBomxcpK3UwSBilnSDFNeS83m+NY2mcRamTtXrvOqlsoniAcBbpNVW8u91qDnku5SfZo
         eZgA==
X-Forwarded-Encrypted: i=1; AJvYcCVDpGrQoazeTlhGNsg0sM4C4Izfp54FrjHuBbfbygx3AlVctRQgIj9TwaEbzeafLeW1lqB+P96FUx8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5jdE9EWjeEq8PlskpMIjIlsXHQdafCAGKGDDtZVGon3QW1/BJ
	Z25cdV/g/rYyy0YdCL8a0zratg7mvOAQzrwDEUGXfY6P0fzQ5JaVP9tIii38enTXWnA=
X-Gm-Gg: ASbGncsNqfP4b0p90K/ioHvuCHYOTEdONO/KXVj8QlyoMgQ+xe6IjYvtu2ytoKWjMfv
	jmP7pHFq7UBDNBc2nFvlJI55tx3hUmbNhWWLMBby1c8TkqMdm+vV3gV5sX+zATqDRqz2Col4gi+
	rDCcoMAripP4j8Dg/gAKSewbpvezpOHFeHJTa5FZ8PAe/uRfGFQAEUy2zt3ktniMY804bvS6dUQ
	Sh22xUyCgsM4c/7eS1CzFum7khWuMVVq5GcU2AL8bD4205NfYZgWF+DLr817C0OS4pof/VT3U+Q
	SksCJg34uEyMUtVwAODyAChIEpvE1RE4BwXcQEAc/JS1G57O+OXki1J1r0asscw/rfCucA9lvxR
	8S9cXLmjlVUnSvUhQCMfE8q1i2CaHAeabEb/Z5vNzjHC/Xupmyg8aNCqc+G3i0qN5fta116UsYg
	==
X-Google-Smtp-Source: AGHT+IEmG4EIM8g9jy0d8DW2Vf3efGjj8YYDTC9Rw1lXYX1N/ZBq6dfai+UY84clpx55CsGPyS3mAA==
X-Received: by 2002:a05:6000:1884:b0:427:526:16aa with SMTP id ffacd0b85a97d-42b2dcd8cdamr11643317f8f.58.1762875972720;
        Tue, 11 Nov 2025 07:46:12 -0800 (PST)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b2e96441dsm21387902f8f.23.2025.11.11.07.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 07:46:12 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
To: abelvesa@kernel.org,
	peng.fan@nxp.com,
	mturquette@baylibre.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	Jacky Bai <ping.bai@nxp.com>
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2] clk: imx: Add some delay before deassert the reset
Date: Tue, 11 Nov 2025 17:46:00 +0200
Message-ID: <176287594553.21242.4694990011730156216.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250801072153.1974428-1-ping.bai@nxp.com>
References: <20250801072153.1974428-1-ping.bai@nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 01 Aug 2025 15:21:53 +0800, Jacky Bai wrote:
> Some of the PCCs on i.MX8ULP have a sw_rst bit to control the peripheral
> reset through SW method. For peripherals like GPU that need sync reset,
> some delay is necessary befere & after release the reset to make sure the
> HW is reset into a known status. So add some delay before & after release
> reset.
> 
> 
> [...]

Applied, thanks!

[1/1] clk: imx: Add some delay before deassert the reset
      commit: 25b47635f8729e9536d2652774bd509532eaa522

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>
