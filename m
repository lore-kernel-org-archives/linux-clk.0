Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884F118A6BE
	for <linux-clk@vger.kernel.org>; Thu, 29 Aug 2024 07:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724917826; cv=none; b=mQQUOngUAyXRn5OgsuMnTo96r9M4NO+okM2WQZNZtGlHAN+DqgCAnkVJSO1PKItL0jquuvmC1vyrC2OK7rGtUl+AnILlIY+78SkgC7IoZgLVWqvpeYXamDsHEBjsg3aFoIIyjxKNYOSj22Iwiz4eIq/FFsPzuGrYuBU9/3VlzkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724917826; c=relaxed/simple;
	bh=flakPB/Oy/MC//bflaM+S4J26kvximlMsgRqG0R+gew=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lTdoJflMkGfImHKzb3qaK8jMXEGH1pKBHTgITQXyLki1pB9IE0ghoX0jTJxK4DVgcfQDT/BI72S5IXkLhyFAx/QbRKT8JsOH4SgvkxSJYUEc55LM863SXevV4JldLixhECoBPR/RIdeUpLethxhDIA4mBLDBRCFztbLDVptvyE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GxTiw4gV; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GxTiw4gV"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5bf006f37daso600695a12.1
        for <linux-clk@vger.kernel.org>; Thu, 29 Aug 2024 00:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724917823; x=1725522623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rtOlD3FPe5eufeLBo3H2oYX+REyBgZmGBdKHUhaeL7Y=;
        b=GxTiw4gVN//HdN/BXpIpNavR/W377vp/AJUjsIbZPpalJrT8mtoQFmek/r4qVFqP05
         EQ0gy0mw9aAjDtn0Tjlb4b74QwRelkh5KLIIq3r3zWfgdoFMfTd5T8MDFgsWoQQB1oFz
         Rh87vAXgePP9kwarVpffjYRch9TOuONWzygGqk3uMAoun9B5eXXwauM7GGWbBeFsZgoH
         a5BO0w46w7CuByhBOwa9A+LU7lWflSxjH9otZTNcJr/KhBv4FY/35BN9HBFaV25Xyt1A
         fmRAYCpkl50sEzSqa8ss9NnbVTcHj4RSGR6vSkRPsPJ7/Uun+1/oQiz6C7Rr1wEhRGzC
         2sUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724917823; x=1725522623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rtOlD3FPe5eufeLBo3H2oYX+REyBgZmGBdKHUhaeL7Y=;
        b=LVAXx+GdnrsvwCmx1RWXm/u/ot+/9lys5BFB5flM//l7HAUfPe5HoTrR2e//IWHiQg
         OsrXUWd52kh3I9TGlhrmvDRebdSEmFWWdIRUJzZQF/GY6n1IWH87nPciqfbH+lQU5O9m
         5oKdA7wmdGNl0NedqxC3oz/AkBfpT2gKslypeVOoQ4+xaEMraYVUDYXxAsGjfqBB0U7W
         Sljg96uuHFNzzu7WGj6LNz/CBQ4cTClDdnZoTh1XQGx6WgeO/KfmoQV6mZkr8Ql8/Mkp
         rYT+GdCrrqriwS/l0kjgEfybXxFN8DPuBbMhxx6BBezrE/mxVq6HoYj5QLXkrlAK5ZZ5
         JEPQ==
X-Gm-Message-State: AOJu0YwpQkJX3882KmtMXeMF3wYNZf7g/1eSGC0v78ZXVO4itV1f7K3k
	yls7P1lMmae+FuFbvfq5eLEXPAjuDIYDe64dI3NpRczyq5ALEzdmuZYeKXINt1E=
X-Google-Smtp-Source: AGHT+IFXOs9RYfg+VvJElRl86xnYVoX+Uymh/Byj0Ee1XO4IInyeCxZFZlFaflMa9nmwVrVrzMyu+A==
X-Received: by 2002:a05:6402:35d3:b0:5be:c8ad:afd0 with SMTP id 4fb4d7f45d1cf-5c220135395mr1963338a12.9.1724917822633;
        Thu, 29 Aug 2024 00:50:22 -0700 (PDT)
Received: from hackbox.lan ([82.79.186.176])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c226c7bf90sm370833a12.43.2024.08.29.00.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 00:50:22 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	abelvesa@kernel.org,
	peng.fan@nxp.com,
	Wei Fang <wei.fang@nxp.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [Patch v3 0/4] add NETCMIX block control support on i.MX95
Date: Thu, 29 Aug 2024 10:50:16 +0300
Message-Id: <172491778768.2521946.17064463983702008243.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240829011849.364987-1-wei.fang@nxp.com>
References: <20240829011849.364987-1-wei.fang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 29 Aug 2024 09:18:45 +0800, Wei Fang wrote:
> The NETCMIX block control consists of registers for configuration of
> peripherals in the NETC domain, such as MQS, SAI and NETC. So add the
> NETCMIX block control support on i.MX95 platform.
> 

Applied, thanks!

[1/4] dt-bindings: clock: add i.MX95 NETCMIX block control
      commit: 4b78b54762dbfc2f22f28655fa3cf6f5d50de197
[2/4] dt-bindings: clock: add RMII clock selection
      commit: b4f62001ccd3fa953769ccbd313c9a7a4f5f8f3d
[3/4] clk: imx95: enable the clock of NETCMIX block control
      commit: 42dc425fa8b5be982bcc2025d5bf30be8b26da86
[4/4] arm64: dts: imx95: Add NETCMIX block control support
      (no commit info)

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>
