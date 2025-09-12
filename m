Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CA8311959
	for <linux-clk@vger.kernel.org>; Fri, 12 Sep 2025 14:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757687761; cv=none; b=COctmCulIx2+b660+Ji+EFiOxAVlzILEDgh8idkfqMWtZMX5yqHDmZy78Bqz5caO3iiS03A6Yq1k+4MM/6Em//FqENqQyInUwhjKviwpwg/I71pHCae3gvie5o76w0oFUl4hOdctVblcksF62JLShUM1yiQX3yx29rL6KYlmzC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757687761; c=relaxed/simple;
	bh=w0HNyCJgCIKMXof21vkl4pN3VquJKbWAGsmHF0hWEh4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kPGyk7ZbBB6u7J5tublokHXkj+aTYvG1rdFuNI5dO+AvjyzAFV4lmzLUrE+iW7HTUdkD+Q3yWbvU8Oi9TaOgmMYKevVSOLsAdcnHrWJDV4vDKeweTKqKNMlH3T8F3Epn8iO6q3hVepy70yaMSTMsOQ7WuFpi/8SZJP3QAp2xAX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P4ohENhj; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P4ohENhj"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3e751508f21so1408002f8f.0
        for <linux-clk@vger.kernel.org>; Fri, 12 Sep 2025 07:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757687758; x=1758292558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rux3uIEwt0djKEKrlDMK9wf/Q+VyRMin5568hbjdQuQ=;
        b=P4ohENhj3OBByqOOeEbxfgzwL3xwxDLKHz6Zdhpph2yJo1NZ+pXODd6pPD/pyHhUYY
         JFqwan1TIT6J4jpigXj/Kq24/REFy0L+ndyPRJ4WckOH3t2WHHiunNBdD02gBySAtp4i
         tap7eoewKLh91qorDe/SWh8D6CKWxhLNaJTiYrdVL6d9zm679o2puGUlgOnAOgGtsBat
         +kGgRk7CEin6ZKhkho8Rl9PEmmmZizfVbprJ68pvfQGL0k+ZfcVTUBBy01svq5BIV/Ch
         7I64G4DYVcs6RiM3QGOQPMqAXW45C0Vwu9PYzNrxr+jrWbBwyREfYHWjPHqmHuy+46K/
         yMqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757687758; x=1758292558;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rux3uIEwt0djKEKrlDMK9wf/Q+VyRMin5568hbjdQuQ=;
        b=W5m+KPXVQksPeDH87qZrHem3CvDo+/T5ZFeG1LLDtZhy9qtAmEeZRnAvGMS+Gg1JaJ
         f3jKugtlf8dOrEr5bGQR8VUeotU+gfvFh97sRXRzuj94p3+GzBH+ifSMhkWP3Jd2g0em
         WW11DHxxU2bLUj05bZGI88zJi3HtIvQD0XjqCFZudpr1A3OpzUwpKoN0hjkX/DU5rlg2
         PjUL/vSr4AMuEhQiCJf8cupspEbSeDM+R8+HI6lcS56LQmusArCVnwlDHGZm/rCNEcqE
         rQwjx/VGLhMYWCBxsH8AWwSn1p0Stn+aEDKetMPOfMn+2fqeySQnHcXs1bKdMxyCKZuQ
         /+Fw==
X-Forwarded-Encrypted: i=1; AJvYcCUwo1sJkS7u4vRGECn+X0o3gymzh+zD/I9ItmjhFJbbz9UzKkuihdn5F+Us6a19fOsfNGMYSzga5SE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1I5LBKDT5ukVP0B0YraCjId4QFhtHlP3xt++s1eXJq3TXjNpO
	npH2yFDKEELUZORhtfDQ7xjAXjS/PFSJ4gI0CmiV662GL6ZXybvuN6bOLiw2anpnn+u5hSUrgf/
	8FnPr
X-Gm-Gg: ASbGncvjRwD/+Q3kAYfvTE/WVswI6WnrQaF4ET2YL3loYKUGS0P2bBX3Kr+WDFuoKTa
	LeDab6kPf1hhTDnHJ9u0zm3jg+p4cYtMcfi4F1Fu6z8aFPztJueaqaD2I+ZIXdba913a6mL/Qp4
	IZHmm/PuWKtIBy7gOJdX2WbA/G3x2zioUyVjFTcvyQH/Y3Szejbh/bsz+E2u0v+zGnBKfPZvnjV
	0odpdZ521xTX1RnU/+61qoVPZvx18S2W6QuUR59CMXWnByPW/rlL/ARkkWe4WTbhBOegzX9Z+oF
	1TbzX4dV8KRZq1oTdrluosweAfqXZMDZUpjkS0n0xZDHeRWnr/mwYLYJAugsBZeK7sj0Lm3IpdU
	LFko16Qd5x3YtcsMdfI6/6vZOtyMIE1pIZQ==
X-Google-Smtp-Source: AGHT+IH67tRYiTRZR0HlitAXkPqySgTj0c7ALy1itAhNYgQLFYvaB09Ls5bZvLW8qeoaRRjgwtFi6g==
X-Received: by 2002:a05:6000:2408:b0:3b8:d360:336f with SMTP id ffacd0b85a97d-3e7658c1c6emr3279136f8f.28.1757687757628;
        Fri, 12 Sep 2025 07:35:57 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607ccf9esm6659591f8f.40.2025.09.12.07.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 07:35:56 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: frank.li@nxp.com, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250804131450.3918846-1-laurentiu.palcu@oss.nxp.com>
References: <20250804131450.3918846-1-laurentiu.palcu@oss.nxp.com>
Subject: Re: [PATCH v2 0/2] clk: imx95-blk-ctl: Fix runtime PM issues
Message-Id: <175768775587.453341.7630569911585966967.b4-ty@linaro.org>
Date: Fri, 12 Sep 2025 17:35:55 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-dedf8


On Mon, 04 Aug 2025 16:14:48 +0300, Laurentiu Palcu wrote:
> These 2 patches belonged to a larger patch-set I sent a couple of weeks
> ago([1]) but I decided to break that set into smaller sets, where
> possible, as they will be easier to respin, to address any issues, and
> will probably be merged faster than the other one.
> 
> Also, I addressed all the reviewers' comments received previously for
> these patches.
> 
> [...]

Applied, thanks!

[1/2] clk: imx95-blk-ctl: Save platform data in imx95_blk_ctl structure
      commit: aa1735d72bc085c4d107fb2017c597f83bb9490c
[2/2] clk: imx95-blk-ctl: Save/restore registers when RPM routines are called
      commit: 14be8b7b6cbc0a072c749e46e28d66e0ea6d0857

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

