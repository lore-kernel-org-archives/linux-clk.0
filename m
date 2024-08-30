Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6663E1BA885
	for <linux-clk@vger.kernel.org>; Fri, 30 Aug 2024 22:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725056965; cv=none; b=nPEaVhEHRgLG7A1+0bUrJ8FJ8O5tYtwek0fdmKTncA0xqAir/qfqNQYmGyd7yAZX1uw1NMQAW9yL1JoHcsuc9eV1tRpEJhLoYYpHHU2BEFt823zd+G01ygMZuihBBBNqYFFJdB+DT2nfzYFFKJXd+qRNiWRuIDZsYcf8IJQioPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725056965; c=relaxed/simple;
	bh=4GgNHNsl6MTwxWAUSSgj5snocnM78gEmhGmvQuLddYQ=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CGt2U3OcFDfxYnSH9ua0uvJlV81h5knpmA5oQbHNzD6GwWfHucvhsENG8aBz85Z+fdsdvAtw2xi/QiktaWQ3EzKZKmes0hjfDn7gLoIe3sAJlJ7hhYWDL0ohSMMB7M9u65q5uewMAvgbHlJdlZdwj7LSU6GbVVZWfbvTgmc+tpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=k2Uo7LK8; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="k2Uo7LK8"
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-498dccd3ce1so779746137.1
        for <linux-clk@vger.kernel.org>; Fri, 30 Aug 2024 15:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725056963; x=1725661763; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2GtqqHeMLIVZafaXXKgt14nskpie4/u6kUld6V4M6X4=;
        b=k2Uo7LK8eJAH/p9vtmdLOMVBe04aEuNA51yqMfc1QGFY3iFf8R7fQ4c1UYBMPIiUOP
         DtlwdqPBoJObxW0Qx28qHp3tgLm0LoxR9SRFLRYFGB8xOiXkkcERW3rbuoaRBKBQFIrB
         Q6fKCXC3kf9vTA1ZapTCQiLUjA/4JSuGMr1B8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725056963; x=1725661763;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2GtqqHeMLIVZafaXXKgt14nskpie4/u6kUld6V4M6X4=;
        b=qK9p32YDYsY2Eon8bETjEHBPoHb+29k6UVWHvv2A0a4XcdYFPqvYgtCt0wjqIQ1okt
         y8F7RwNJ4e3geJ5C1Ou1qlY5Kg+jI/2gFdZf2WFTcjDtiZrCPpN/yJlsuqMPRnfH3/my
         GxzgSnkNt/RBBql4hRpURBOS2FTQsG6GpU2T++SzXHhkXrdkbhvxZbdcAYhPOwacQyTI
         RAHKrEBxFfCDDlId/+7cYOer8PuVW6MV56BsHk8xYEGej2ELt+5I14xuHl41rssnk5j5
         A6U0mqwkZzS0Fqdzrz3khfKwi8McT2tbg1nbLFSqRnMYPYtb/qaD9x/DLdIQKLLBsmUg
         Ryhg==
X-Forwarded-Encrypted: i=1; AJvYcCVIkXdszhUiDmdNbVAb8WaskVk9s9O+LsfTdZDGD+rBf5wT+YzywLN0UL+wEIVVFGIub0nCXNceZmc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm9HVI6s5JXCznVF6hWJ8Ce7Uoe/X791dgXzzt5BkcH02UMuF7
	B0NSwX0N1l2OaamQf0nGnGGgrwCmUaQ/hcS42GO9LBWDdGe2fZbu65tNxK6OpeIRCmcjNU7jY4x
	3/a8mh/lMR4s38pT2gwIOwOEkhmS0leLsLt/P
X-Google-Smtp-Source: AGHT+IH3cxSAtR2IOZY8n4PObzrdg7w+qSsS34kPT9uz2UEJg985EoHLslmaQuDZB6axejHFWN7bvxuNbWFx030eruA=
X-Received: by 2002:a05:6102:c87:b0:48f:cb62:231a with SMTP id
 ada2fe7eead31-49a779a41d4mr878635137.23.1725056963156; Fri, 30 Aug 2024
 15:29:23 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 30 Aug 2024 15:29:22 -0700
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAE-0n51Ag1wpj0uUPVtMvgZJE2FF_FZkw+j=bRiAq3vYk=Y_Fw@mail.gmail.com>
References: <20240828171722.1251587-1-swboyd@chromium.org> <20240828171722.1251587-2-swboyd@chromium.org>
 <c1e35d3d-fa00-4453-aaa3-9f23a07acb4f@linaro.org> <CAE-0n51Ag1wpj0uUPVtMvgZJE2FF_FZkw+j=bRiAq3vYk=Y_Fw@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 30 Aug 2024 15:29:22 -0700
Message-ID: <CAE-0n53rNuyXcVcqTBSgbNzuJzCBkaHE21dPNkMTrs=BCTkmPg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] clk: qcom: dispcc-sc7180: Only park display clks
 at init
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	patches@lists.linux.dev, linux-clk@vger.kernel.org, 
	Amit Pundir <amit.pundir@linaro.org>, Taniya Das <quic_tdas@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

Quoting Stephen Boyd (2024-08-29 09:34:05)
> Quoting Neil Armstrong (2024-08-29 08:32:48)
> >
> >
> > I've been testing this serie on SM8650, and with 01a0a6cc8cfd ("clk: qcom: Park shared RCGs upon registration")
> > it fixes an issue we have that triggers:
> > [   18.740736] ------------[ cut here ]------------
> > [   18.745837] ufs_phy_gdsc status stuck at 'off'
> > [   18.745929] WARNING: CPU: 1 PID: 197 at drivers/clk/qcom/gdsc.c:178 gdsc_toggle_logic+0x15c/0x164
> > ...
> > after waking up UFS from runtime suspend.
>
> Oof that's not good.
>
> >
> > So I suspect we'll need to figure out which SM8650 GCC shared clocks would need
> > to use clk_rcg2_shared_init_park_ops ?
> >
> > We also had random boot crash when initializing the display very late on multiple platforms,
> > and so far "clk: qcom: Park shared RCGs upon registration" fixed that, but I also suppose Ill
> > need to reflect the changes done to dispcc-sc7180.c to dispcc-sm8650.c and others.
>
> It sounds like it's better to make the default always park at
> registration time and special case the one or two places where that
> isn't possible, i.e. USB because it has special rate requirements. So I
> should just go back to v1 then and pile on the QUP patches.

I've done this now and I'll push out clk-fixes with the QUP patches.
