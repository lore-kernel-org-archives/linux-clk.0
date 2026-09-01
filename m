Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC048365A02
	for <linux-clk@vger.kernel.org>; Tue,  1 Sep 2026 06:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788244525; cv=pass; b=CtvvrqwdZuoYZPnTwKHBs/7cES7zHiXE+yFgbWZgVeg4OckuFSJfjdJOpiFLDjTPKDJ9XmA/zcS/yc2ToqMDbiq/rgf7VPI3vcTMJtiwdfyr4RGMMzj+KYkt2OLOW981gLl5Tf07s22fUxiCtpTp7aqePaMWqxyxyNRkdqzUv9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788244525; c=relaxed/simple;
	bh=BDon4cDpFmYz8mQwr3AAQV3DrhPj3IR/41250WfkfjQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r+R0k96iTPD6nQavLX8ifDZtrIsYRxtZFdO68Y+SaWl6P8vamuM98UFl4Eke3p7L5iBKQPy5KzMHlr9q4bhS7NVKZMRwlx9kvfcUrwzaVJc4pec0KtJ3iIE+ErDcmE1imwlXJPYJDR2fQo0cQqCX+NgV6BIXiFJCSYEb33KmMIU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aJuaV8An; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aJuaV8An"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a5f968ada7so1429918a12.0
        for <linux-clk@vger.kernel.org>; Mon, 31 Aug 2026 23:35:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788244522; cv=none;
        d=google.com; s=arc-20260327;
        b=mQVHSWJzTAz8jiP8mAF4kYadsE3Pc+yflNqtoXYh4gTSy4rZWLAqywesjE3BqTtOdL
         t+ssXeFVDKLVlnh83h1hiIGlrlFmk4SCEsuvqsw7HZ61fT6+eFbdeqAy8SBs1xyIxsir
         tL0COZ9AFSuRLvp1+x3NUEwmqFI4xr7VzYNbue7OSbCdCMImGH7aanz7+Gm2YCFQQKES
         ilp7xpMyyLxgkszRn9VUBnFwXFA4UdqPndZm85GBYzhog0A6gxau5NotNJSp8CzzfMyQ
         thyFcbQtaTIr3z3WMNr9Q8PC9dmQyY23B6OGOx2mhfMe3SWuOFDFY3GFHyjo5gWXZOsO
         tcJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PBRE3q8NdTAYGu0/68dIptiFGGW6PBAW2Hf2zZK1ifU=;
        fh=U7RTBUrgKlHrh5R1qv65Mz1/oBQzuqimDSjCpX6joVY=;
        b=eKZiLb016GvTPklB1yjJwyD86DmXzicB8CXtRwnASl/xyFXqqrJ7O8L4RQ0SLaKSUM
         JKexJvqezVKFFiBOVlgZNO6rmgrbc55YxkMSCApY3px41dUDbXWvGZxai+0e+MLyhDkG
         3bo35ancoYwez3xCjUIw0vHDGgyZlS51EYGkfQRKRO3oeCYmJZ+7r8kty5gZgSJzPHDL
         24FMO88foHaWQBx6XTi6j07Wks/jVBMrAZ6tebUsM3oaRZRVyQZTafGqoVLWN8DlCWbo
         4jjLmZ1ZK5pbYNFl36nYZPVGX4g9gwxnlMeY8WXxhbS+2ZSfyJ4lEpzBCCnbupvH+Hpm
         N5sg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788244522; x=1788849322; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PBRE3q8NdTAYGu0/68dIptiFGGW6PBAW2Hf2zZK1ifU=;
        b=aJuaV8AnNKXXOBUpWLK4vmUqa63/rYdfhLrWH4OC8LuQ7iZGjM2qhAW4Zj7AjPB1Wk
         COYUzhhxr3JQoXTMUHkbDDejIEM0R4rEmPDgezWB75j2GMgDPuwIGT0Vukz8ZDjA+prz
         vrI7pDhJLZctnjEWZF+xFx8lZUXJ4AT3PhM7HL3O9yPJqRz+M5Umla29sf2ay/YTV1UG
         i5e6QpUasjkFkBZP22NlMTmzcy7YKD5yDbMEA6w0/ddqDDY7b1vcclRmEyfGmj5N0F/Z
         FYGHIlIOe65L5fN/FXC2C8Z6hufXsqPivD8ogtJujMhae9khHKSVj9SpSirplcC9w6Fi
         cNAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788244522; x=1788849322;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PBRE3q8NdTAYGu0/68dIptiFGGW6PBAW2Hf2zZK1ifU=;
        b=BJw10nl0h65XXMB/2nk1KRrXMYvPCz+0QR03dHD+aa92dQz081KukVOxnqRWXwWixI
         RRULZQ8b/SmQXzwYxreCZfOQw7tKA0F8CuiAVM/LuI1UuoFtecR4f82FRgNbquPjE2FC
         UR6GSms/BCXW1krqnAymiRhlCgmBO2HaNKOzsbXQSvo5C3rm/4UKZJuyQ8ZWwGNlp/XK
         2yvMP3la4ZpqU76RYIn9mH4cbAI632kIqmWSsjKiPilVK+Bp2p7DxXnzCWCuASGtxz8k
         EDz9HHHWLPrlNC+RDa3s6uLXzmhxGUI65IeupEd5F4y6ITlK5zpvwHn3LYpQHtZjFrHU
         /IwA==
X-Forwarded-Encrypted: i=1; AKwUvBz22Wnt967nvK7lSpNigqEGwnG1XpwcjIPFg3LtZCiih+oJ2xMw7Dsf8LLcMSLlRCAEiVMI9bE0RKM=@vger.kernel.org
X-Gm-Message-State: AFuF++lLECvViKA6zNSR8uMOvuVjqwUkFd/Rni3Y6SWQodaFitdz298k
	PpBGTODEv3FMRWKLuXLLobharC56ayXSQWAuX7TcLtT8lTMGRvgPl26f8yvOvsLJTml/2SlgExB
	8VY/bx5CDz6bTZkCBePbfSJhTjsMZGY0=
X-Gm-Gg: AYBFou1HAJV0Z6/qC4e2YBPJRgzMNaEVXNHymck9gc/QNVYWMShTQsnwVnsmJrKI0W1
	27UluLQxVCoIhetKKmfcZv30HHJ9QwTi2AYNWTCLPUoDJjT8RGPuft/K71POiOeGiggNRKuilZa
	iQs9F7LYBOs+2D6VL0g7/xalcrc5u0DhkYObXZXov1H9Mkdi9rPYGCFARylpcjYSm+ZC6w7tGwR
	i3cmZGQxq4EbAYU5ss7hVEv4aRp9spg8G3tK61AGDJE1kkn5tOZVMP/iEdiZNbzHB5d2C4h7TpX
	0OddF9AL14eZv0nEPiNEpLE2E+k2IDQ7sG9I/IITfaOKC57CjrhIG6y/54D/+Fbo6y+wWKd6XOz
	IMw==
X-Received: by 2002:aa7:da11:0:b0:6a3:ec9f:7e3d with SMTP id
 4fb4d7f45d1cf-6a66a611510mr1306101a12.6.1788244521855; Mon, 31 Aug 2026
 23:35:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824150156.1310-1-sreeshankar0910@gmail.com>
 <20260824150156.1310-5-sreeshankar0910@gmail.com> <apYNXZ9TJEC6rVVf@baldur>
In-Reply-To: <apYNXZ9TJEC6rVVf@baldur>
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Tue, 1 Sep 2026 12:05:14 +0530
X-Gm-Features: AcwNN1U5hmy5zAxaLt_MG_Oo1HmGFV9z4ZXwGALePDH7cPQz-NpgtyLXkjVfVO0
Message-ID: <CAA-+ukLm-6FhxytqX1=x4pZUqZU_bmB+hVF_+5K1AW=-ZpPd8w@mail.gmail.com>
Subject: Re: [PATCH v6 04/13] clk: qcom: Add Global Clock Controller (GCC)
 driver for SM7250
To: Bjorn Andersson <andersson@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	mturquette@baylibre.com, sboyd@kernel.org, rafael@kernel.org, 
	viresh.kumar@linaro.org, konradybcio@kernel.org, tglx@kernel.org, 
	ulfh@kernel.org, bmasney@redhat.com, radu@rendec.net, 
	abel.vesa@oss.qualcomm.com, lpieralisi@kernel.org, 
	taniya.das@oss.qualcomm.com, danila@mainlining.org, davidwronek@gmail.com, 
	mani@kernel.org, robimarko@gmail.com, linux@gurudas.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 1 Sept 2026 at 04:56, Bjorn Andersson <andersson@kernel.org> wrote:
>
> On Mon, Aug 24, 2026 at 03:01:47PM +0000, Sreeshankar K wrote:
> > Add support for the global clock controller found on SM7250
> > based devices. This should allow most non-multimedia device
> > drivers to probe and control their clocks.
>
> "This should"?
>
> >
> > Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
> [..]
> > diff --git a/drivers/clk/qcom/gcc-sm7250.c b/drivers/clk/qcom/gcc-sm725=
0.c
> [..]
> > +     .clk_regs_configure =3D gcc_sm7250_clk_regs_configure,
>
> /home/bjorn/sandbox/kernel/workspace/drivers/clk/qcom/gcc-sm7250.c:2228:2=
4: error: incompatible function pointer types initializing 'void (*)(struct=
 device *, struct regmap *)' with an expression of type 'void (struct regma=
p *)' [-Wincompatible-function-pointer-types]
>  2228 |         .clk_regs_configure =3D gcc_sm7250_clk_regs_configure,
>       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 1 error generated.
>
> Thank you,
> Bjorn
>
> > +};

Thanks for catching this.
I will fix the error and send a v7.

Regards,
Sreeshankar K
