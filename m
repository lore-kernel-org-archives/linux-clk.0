Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966F21D27A8
	for <linux-clk@vger.kernel.org>; Tue, 27 Aug 2024 18:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724781845; cv=none; b=B7pHfa2YqYDCfz3p8QWGRHKiGXiXGq3d17r9rx8EVvV6vJ9bi4pdgd81ALAzHwxZXua2mYpYlpeDhCZqAJGJ34NTnuQ3NMsRDOyWU1gGky1g3onTfObLTB9mBI3jL9/QSuUMFTFzhukDW1zcENaboV9T6NEA9rilqq119dEile4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724781845; c=relaxed/simple;
	bh=ljNQ7arYgd97/fkr6o6r79Qw0skRIiKXIc+DDFjF02k=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r+fqbFm7oGbSus4tphnt2Xan1NGc5JUeBTpDz7RpApZGCvqVEK2smd8u6EivEVsmKq786TJX7pp50S8IDx4CMSgxM9tMz4zbQfAlnE/KdFAp696dz2n9vCYeswjxnB+7/2GUai7yXyy1+BVxbTN2r8+Va8i7V4AP2ZIjJfE010s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=G8O/SP4/; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="G8O/SP4/"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-27010ae9815so4387025fac.2
        for <linux-clk@vger.kernel.org>; Tue, 27 Aug 2024 11:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724781842; x=1725386642; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ljNQ7arYgd97/fkr6o6r79Qw0skRIiKXIc+DDFjF02k=;
        b=G8O/SP4/tz0YAqLt+hbyysVAfCzMk4ChGbmev+hKLZb6JGwgE08S5PSdwXkSUi/OF8
         Bi0c/W1MnmtsJqCeyZANtXo0iIbkkOVsLZ8DSRJLOmN9xD4K0SJbwM2Kfylo3WHm3loz
         g5odXwNba7KYb22D/J8GvyDbVKg4BqXJeVGqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724781842; x=1725386642;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ljNQ7arYgd97/fkr6o6r79Qw0skRIiKXIc+DDFjF02k=;
        b=NXxVPvi6GSMqUrEh9YxAJH4tlLvdpboMQta33/HsHtJ2hEHacR11kMov3076TS48/e
         bpzAxS3IF4o5eudYkoLt4LjJaEtvS9em49rnj/jr850VSxVetzm2hnvAoXaWM330FbNV
         QPGNQd4P1ArxCL0C/6RlLXB5Zk3y0/3yKiOjja2RFuFnJmrnq5vrDbblWQz/VF6jbLPt
         gy5D8MYq4R9N1EjsH/wLxlbQ/I8iLguiQ7iWfl8PaVsAB+1dQf1NfnsHYDi/i3MshYkG
         jokpJUgXHvU6V5pX859gXtqZs8haTHYfauGGAzykUC3Q6OdPY7PxUqwWD/wRcQ3L69dG
         poew==
X-Forwarded-Encrypted: i=1; AJvYcCXpSIugGv6oalGK0/vx8GRkNzaKq/ZpXx6Fej2N9xdoElYhlIAOnVtg03dOSUutPeW6crsvGo2qbTA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfcYPXeisLIjv/abR3XbWtLQVwtPslPmizIRy2Vqts+1Hp+flA
	Uc4l4jRBZgSAmQPncYZri1RVQb2cbE1PzJ3KgpVz+1In1V9ImeinZWPOuw0QZ7kQwybLYVHsuZ7
	AYTNUGTJEs4bB4TOK7J2fScN+Ve7Z4e7HGX0z
X-Google-Smtp-Source: AGHT+IGb5F/ggcI3jz1RUx44031WcBMTlky7xP6DWT8xj1loQKewOpYzcoFYeVm5Bcffm7Nj9lhcl1vtTTW4UO2x4wE=
X-Received: by 2002:a05:6870:970a:b0:268:2efa:2de0 with SMTP id
 586e51a60fabf-273e6469d6dmr16662999fac.13.1724781842495; Tue, 27 Aug 2024
 11:04:02 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 27 Aug 2024 13:04:01 -0500
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240819233628.2074654-2-swboyd@chromium.org>
References: <20240819233628.2074654-1-swboyd@chromium.org> <20240819233628.2074654-2-swboyd@chromium.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 27 Aug 2024 13:04:01 -0500
Message-ID: <CAE-0n51fjJ8QO2eAy5ZbQOwo9Urzrv1NnXw6KzB=mwHoVoJKzw@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: qcom: gcc-sm8550: Don't use parking clk_ops for QUPs
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	patches@lists.linux.dev, linux-clk@vger.kernel.org, 
	Konrad Dybcio <konradybcio@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
	Amit Pundir <amit.pundir@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Quoting Stephen Boyd (2024-08-19 16:36:26)
> The QUPs aren't shared in a way that requires parking the RCG at an
> always on parent in case some other entity turns on the clk. The
> hardware is capable of setting a new frequency itself with the DFS mode,
> so parking is unnecessary. Furthermore, there aren't any GDSCs for these
> devices, so there isn't a possibility of the GDSC turning on the clks
> for housekeeping purposes.
>
> This wasn't a problem to mark these clks shared until we started parking
> shared RCGs at clk registration time in commit 01a0a6cc8cfd ("clk: qcom:
> Park shared RCGs upon registration"). Parking at init is actually
> harmful to the UART when earlycon is used. If the device is pumping out
> data while the frequency changes you'll see garbage on the serial
> console until the driver can probe and actually set a proper frequency.
>
> Revert the QUP part of commit 929c75d57566 ("clk: qcom: gcc-sm8550: Mark
> RCGs shared where applicable") so that the QUPs don't get parked during
> clk registration and break UART operations.
>
> Fixes: 01a0a6cc8cfd ("clk: qcom: Park shared RCGs upon registration")
> Fixes: 929c75d57566 ("clk: qcom: gcc-sm8550: Mark RCGs shared where applicable")
> Cc: Konrad Dybcio <konradybcio@kernel.org>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Taniya Das <quic_tdas@quicinc.com>
> Reported-by: Amit Pundir <amit.pundir@linaro.org>
> Closes: https://lore.kernel.org/CAMi1Hd1KQBE4kKUdAn8E5FV+BiKzuv+8FoyWQrrTHPDoYTuhgA@mail.gmail.com
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---

Applied to clk-fixes
