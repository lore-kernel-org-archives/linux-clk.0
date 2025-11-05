Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845212FFDCA
	for <linux-clk@vger.kernel.org>; Wed,  5 Nov 2025 09:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762335234; cv=none; b=GwKR8+cpULkRhuJcsJK4L95tAnMsin/QnvAKWG/YcFVeiwIdJobaVIlhEKfO+2/baMTe8GU+g7/asq2nXnRxLpJxowLgdfSF1YzxjoEZjw+ZUm/irJRCowxPT2w8cmyqPUT1BlKJmrhUp+r/Rib2PwEUXl30nuquS8IfxVMVnKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762335234; c=relaxed/simple;
	bh=xVz41K+WHW2r1NR5xRjnxTEmTL3ZEN3/EUCpmw5NHe8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UFdOnWn6vKKqGhHP4L/PjOxjyv2Yowgg3L6ifz3zNxnLcjnGi8dmLNtDbVLUxITd1+oYYOUYcYt2anDS9K2hyFRSCH2458MuJl+YSwdLrL8nuPYDzjgsCgaX8stZuVQcuK85opA9p0msm6SUZLS2QLoUWTg93zY36Vfuf1v38us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D5xyrd2t; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D5xyrd2t"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7930132f59aso8939169b3a.0
        for <linux-clk@vger.kernel.org>; Wed, 05 Nov 2025 01:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762335232; x=1762940032; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xVz41K+WHW2r1NR5xRjnxTEmTL3ZEN3/EUCpmw5NHe8=;
        b=D5xyrd2tWg/Oh5hwcEHSeLOjURl5et+LBeg7W+NnAvM06/fVKs/aXlU5p3JmAT3maF
         rIR9DxyQFDcC06WG/+L8tbwWOObZKP2d9eZ45/UgUiv3rOOx0z94ltOaahtRhLLSaTVO
         tMUSf9ZQU4Yp3B8/4EQPq1siLJMAX3ogfnUsoWh0/BywrDaW8St8CAnJhrJ/k10KT8TP
         114g+MPMKjdUa5+dH3VTWB1OLD2qp+eOPkzLNaqVjKdcuHXSGReDRamvn21fD1nM7xz5
         fnp+qvDqnvtOAQUj3lehIngY6mIUnLTGsmQK4x1UDaNcY62fnIu/2K4R6zwTB7ykuuw1
         7M2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762335232; x=1762940032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xVz41K+WHW2r1NR5xRjnxTEmTL3ZEN3/EUCpmw5NHe8=;
        b=J/f2sn4avZYIGLlpyOSpC9+a71pHQmGfMapstIihiSgvMYKw64VQ8GwTQz0hsA7UcO
         ZRUbZHrLQT0wiWEAZOArkIVW6awKQAUt/wvkiKENCQ60mZwfo33iqY67VP02bIb3/44i
         io7u9/xq9bf3ifqqSr1cw6ZiYoMYtf4JyeBuRS6CGsLnCnuJMtmKWas88QYJvobHeMh0
         lLTwzsy7bI9WtW07f5d0JJlviGUQQEpmJZW+tMr9IjFU7lCDWlxkA7nDDP4rJoF3Twpk
         dtQyv/N8D8WVmUr5DyLkfUpdoeIQodEIGNNzCW1afNaGbCa3Kjy12gyGQ5k1YCIHKWOH
         LfQA==
X-Forwarded-Encrypted: i=1; AJvYcCX/El5hqI4LUJYzPUZ1JHpNMK+plwZCpnsLnapq4FNos8OqB9rPchoxToE1IoCp2LmzNfqPrYnyeFE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywvm1oikWNgpWxxBDfYvAnZ+/u46GNW+XIEyjhP5Iyx7ww7Fd6y
	Xt6pc0Lsd6Z4uh/QfGzxl0ThJddBe2hpP7JZyc+bRLpmevXb7BL6T3nL13VWorn6incmYR8ik9o
	vfykhgeFIAjsGo4PiR5od02yAU7GjqOs=
X-Gm-Gg: ASbGncubB3U5MMDK/ld2DeJ3sWBZACY41o56N1HclVgmnXTIHy67JO4LPwAZby9G5pH
	LEQ1nN/YGpXqWNLuakZiyo3HyT01JKrdFoHnxOp3D3tbxbY/B6Czw+1GYtAbEtMuMEne/hQTZlX
	zr950YI1rihVwobQkvIgiIM9ImBzNuerObbR/DmbKyV+wZH3lWm9Uafpi0b/eOSyZXiFfqZS0pj
	YL6u6pqYh/uAHz+2bda9YMtITFfeC+/hnFHYX8Dudd80/CockbZWx0rbQ==
X-Google-Smtp-Source: AGHT+IFGxIq2XgduSb+stuaocak2phBxCIezkzwd+AAubIHJ9Z+vhmNDyViyBoMY0DIaLUkKe02kAuU0EhMWtzwP5ig=
X-Received: by 2002:a05:6a20:6a04:b0:350:5b75:6959 with SMTP id
 adf61e73a8af0-3505b756d29mr452994637.32.1762335231830; Wed, 05 Nov 2025
 01:33:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251104120301.913-1-laurentiumihalcea111@gmail.com> <20251104120301.913-4-laurentiumihalcea111@gmail.com>
In-Reply-To: <20251104120301.913-4-laurentiumihalcea111@gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 5 Nov 2025 11:36:19 +0200
X-Gm-Features: AWmQ_bnL9LXcRTfkqLXg0rjUqS39MT0GLWaNx8agMRC1jfxbVmtMKne3NHlmeiE
Message-ID: <CAEnQRZBENqUOTbdubTsNsivGtfKOqFqqTadr-jKkMGEwBvvnAQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/8] clk: imx: add driver for imx8ulp's sim lpav
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	Frank Li <Frank.Li@nxp.com>, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 4, 2025 at 2:05=E2=80=AFPM Laurentiu Mihalcea
<laurentiumihalcea111@gmail.com> wrote:
>
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> The i.MX8ULP System Integration Module (SIM) LPAV module is a block
> control module found inside the LPAV subsystem, which offers some clock
> gating options and reset line assertion/de-assertion capabilities.
>
> Therefore, the clock gate management is supported by registering the
> module's driver as a clock provider, while the reset capabilities are
> managed via the auxiliary device API to allow the DT node to act as a
> reset and clock provider.
>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
