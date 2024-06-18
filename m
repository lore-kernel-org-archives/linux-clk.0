Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791AE13DDD6
	for <linux-clk@vger.kernel.org>; Tue, 18 Jun 2024 10:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718706181; cv=none; b=G/hdpiqCwd3SYY9q+i44eor1RkZ5ZjBa/0RWHGrs0LiD8WxUu8CB6UekSvoijYhPQ/VyFVdgKHB9Pm1N1O2dRDolkOslmf6Ru5lB2B2xE5tMvS8oGZgzkXf+BlkG681AXnnwOf72dpDFbjXbJbv90QeQMevHXJWP32wk6iJ/tRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718706181; c=relaxed/simple;
	bh=ihV4mhCIBMNw0GbrSjpo4F1rbbfmrGIFerZHE45EcbQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EmORami9q/kPw/VHcdqF3evTOO9BobQz1PJPWsU4PmI+1JyptrdSti1zxKB+pSxb004iwtp9rCE9pl0zB/1wn9YbceU9IvL1Yeqd2FqLWfNPOk/ke2DGdk1WTP6nNzVrUrBdvTaaYB2tSCipAEyMThFxEQocFQCzwBiy70SknFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qrR4+QWG; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qrR4+QWG"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52c8ddc2b29so5716367e87.3
        for <linux-clk@vger.kernel.org>; Tue, 18 Jun 2024 03:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718706177; x=1719310977; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihV4mhCIBMNw0GbrSjpo4F1rbbfmrGIFerZHE45EcbQ=;
        b=qrR4+QWGX/V4Z0fooMKHUzG0SCAqQ377tFKzKAR9H65J1Atf8JlaTTSFZCG5thE3sn
         HbOSgCwep3q5RtM4FpXdQDsDvjDe5is8vnMOrjdeG70uSWmYFKqYyFDAEvSILpj6xybQ
         p1tX8LisknFalZE5MRQjQqzJeHvxBz2gI/jbSBW7fygf/jt1nLY51QO/y2l3pychT7g1
         zJGgfIXhwL7FNHYd8RZOnFWVZ01i3Ak3AIdV5brRLVznaT0xEoCQA++ZTkHsHqe6q43t
         LtrASAyP0OpxqM9ucFidIEshKABF2dOL+9X0hKnoaTDu9TDyI8bji27IsQBVfvjm/sOP
         PweA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718706177; x=1719310977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihV4mhCIBMNw0GbrSjpo4F1rbbfmrGIFerZHE45EcbQ=;
        b=GcdtjWTPjClycKZun1DnHFNRkd6S1ywPBOWYT6W13Vx2RUvx24lBCQcPsR0j2OUFnt
         zCHKRilYawcXOZ3vCmOdCrWc7YfxBHIpNplSiM2Oj7/8MBYzilow6u7MAdFOC/UcIZPb
         LA0DHmJGcYOOiEHNqrRT62o4EHwcHFfomH0Eppp9XQDW/dTBDiaZTk7reGPPTG+/OVDk
         9OPC8SHdnSbYZp7Dy/dbFCT4Ez1s8Z1xpPZ1qFjENOKwOKvRx7XLAL3rLOlz4H0pVN3f
         HJ/ya0n1LimiH8kVtvlzgFwQUkPcw4elTzZbCznUUE2XZpPWoeycb7o08FZwxit6jn5c
         ZBdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwWxfYpIflChmzmj+YuYrl0O0yHqftGgb07Z1ct125dkL+6zQMCdXVrFTGq29zLGkKEghWGdNSTFtJjZ6bs3BjbbvSVxZzVLyE
X-Gm-Message-State: AOJu0YyJP4+dNX3vJhJ5rNDCUNQMwkgjgZJ1t4BrSo/u3uWECojp+n6f
	dPLdiM9y1uA7SOHLJfofD2yBINOV8r3CKpDdzEBoc0jrmi7UP/XhXz4dJZSi62xkDLAhLTjpbaP
	sQX6jMAlMWNmrzIK7Cj5dXw7XvtLah3hK1ctzrw==
X-Google-Smtp-Source: AGHT+IH022WCOLlxYlftggBORDsbGqRdC1MMvSHHgSlDUwRF2SFmVC/CN9nibvTBvxf4WniRU2b80Vh9i/HWSfVw6SQ=
X-Received: by 2002:a05:6512:4010:b0:52c:90a6:35f7 with SMTP id
 2adb3069b0e04-52ca6e9af3amr12476647e87.58.1718706176667; Tue, 18 Jun 2024
 03:22:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240613-md-arm64-drivers-clk-versatile-v1-1-6b8a5e5e00ef@quicinc.com>
In-Reply-To: <20240613-md-arm64-drivers-clk-versatile-v1-1-6b8a5e5e00ef@quicinc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Jun 2024 12:22:45 +0200
Message-ID: <CACRpkdYmG=M717a0gmOmz2EtZY-AcxO+_a9Pcaicwq_iVNr2Hg@mail.gmail.com>
Subject: Re: [PATCH] clk: vexpress-osc: add missing MODULE_DESCRIPTION() macro
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2024 at 11:55=E2=80=AFPM Jeff Johnson <quic_jjohnson@quicin=
c.com> wrote:

> With ARCH=3Darm64, make allmodconfig && make W=3D1 C=3D1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/versatile/c=
lk-vexpress-osc.o
>
> Add the missing invocation of the MODULE_DESCRIPTION() macro.
>
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
