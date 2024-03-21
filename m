Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A2E5646D
	for <linux-clk@vger.kernel.org>; Thu, 21 Mar 2024 10:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711016796; cv=none; b=SmpM0dpTIvtDz5ohKZHeTZAx7Yh4gvJu8u7XiZ/nPNvCSTkxS/zKNdEzjdnGn6LnQyO1Ze2gntMXo43bYAiN2uFijdrLHynxDAKtnp6647roHdolqcvlAuBH1DleaztAf8IDByQGa0qt17zSv35hJHzcIQRBYjRB/9XdZL9Qivs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711016796; c=relaxed/simple;
	bh=+884RlU/GlvwTUa+q87xsqia51wLJdHzo+MtTS+qfuA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H/4K1W1INegaxY6x2M+xKHAUpWthQNqODdRZFKMEQvI13hNtBj7cK/2XQHA0RW/Ut9lfXpLESAYk45nKpf3yMiF90cMyx9z200bV7SdzX9AAuz2RIGxwdqUdtNM9poWgL19tAZute1NkpIjkRQuqq6MZFrk5f2e5SjEfy6swpTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kg+5ZZLh; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kg+5ZZLh"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-610e272028aso14828777b3.0
        for <linux-clk@vger.kernel.org>; Thu, 21 Mar 2024 03:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711016794; x=1711621594; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G1DsQsCfjVXlcreC9mkpHOUXs3G0EDhLcSU9dnMnmlI=;
        b=kg+5ZZLh+doRgTaLkijY08SgBBLjl9YUBJ3oUe9BEryI7Ud81dZkGMzUsR3GI8dIvZ
         Mq/jTO2KhL7ferxBN/HoUIkDXzkjczA1Qzu5+a5+rH+zy/8dNjUPmBHOju8RXLkSuf+G
         J5jBJ4n3ZmbR37wH9pmSu4aqcV6m3ougqSZx8gwPjxEzz0PehxhclKPKUafKBOiku7Yz
         pOEph7nvmuFY15RfYBZCQ8/VO1Hb99KMcFnNFRasyElNltmHdi9Dvi6F1oe1Th5WG+Tr
         EuprPQ7t/Li/2Bn1m3MFDh7pjNzcFZsYkd8jwMkYM3ogqt1WlZ75oihg0vJRv3iNp12N
         Ux+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711016794; x=1711621594;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G1DsQsCfjVXlcreC9mkpHOUXs3G0EDhLcSU9dnMnmlI=;
        b=CTRBQy9mn7DMr+Rm3SxtVn50wmbUAaBHyW4rem9MxWjBxtUxfH6iA3VYFQC4aP6MB2
         NIxI4gZfXlkMV7kvIkPW/5yA3y0b7+lPjX/Dd3a4dpsDlds5QOgIDkK3VKzj/vPwLGtZ
         1qUcY7hYkooin2lrIQUx4qjCS+fVaX7wlSRiOV/vCiA5DRMSWrwSr9Mz80mSWf7iA5G1
         fcmaL6goAsgv2lXgC3jT6cLq/yw/jVOGOZnawqjuEOTYqyiX6edZEAuf5aH9448zla9+
         DfRuncf368pX0jAV4se8sq6LF8jGzLao8n5G3SlXkd1+V7E9oECCkhDT32PA+ShPJ3op
         50Fw==
X-Forwarded-Encrypted: i=1; AJvYcCWjoed1nc14To5ppbrbNK5MsQFgtYRTIARcgbuqC2UE4BB5mWVb2L3AXTpyd/tL9mfDMGw8dv8Hyj0V7FCkbUne206TwyZwBUfu
X-Gm-Message-State: AOJu0YxUjUcBDuJco3WnSoJm9YmODBxw7rBK7S+W1iIQeSYJ1NoYV8r/
	o01wwuLkxRmIdTKKR6xQuSJjrLYOQKmDxLHOoKSEpXLO/NEgBQuyS3lRThCNe0j0ZgHYJiLBJb+
	duekSQSZz/zkGWFKjwHMmNx9ZmSqcmSPWpDrtgA==
X-Google-Smtp-Source: AGHT+IExb+vzGD2UTaSisA7Z8I+voE+Wf1d1MMMQfTeCa1gMgMMvvTYLlKLB30P2jM8a1OlAg5BhSTY31uqzspWQZBA=
X-Received: by 2002:a25:7208:0:b0:dc6:e7f6:254a with SMTP id
 n8-20020a257208000000b00dc6e7f6254amr1505416ybc.8.1711016794255; Thu, 21 Mar
 2024 03:26:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240321092529.13362-1-quic_jkona@quicinc.com> <20240321092529.13362-6-quic_jkona@quicinc.com>
In-Reply-To: <20240321092529.13362-6-quic_jkona@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 21 Mar 2024 12:26:23 +0200
Message-ID: <CAA8EJppoeOgcEoaoAYs0cS9yVTPOOwa7J47GvZ=OHNRZzj69FQ@mail.gmail.com>
Subject: Re: [PATCH V2 RESEND 5/6] clk: qcom: camcc-sm8650: Add SM8650 camera
 clock controller driver
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>, 
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 Mar 2024 at 11:27, Jagadeesh Kona <quic_jkona@quicinc.com> wrote:
>
> Add support for the camera clock controller for camera clients to
> be able to request for camcc clocks on SM8650 platform.
>
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/clk/qcom/Kconfig        |    8 +
>  drivers/clk/qcom/Makefile       |    1 +
>  drivers/clk/qcom/camcc-sm8650.c | 3591 +++++++++++++++++++++++++++++++
>  3 files changed, 3600 insertions(+)
>  create mode 100644 drivers/clk/qcom/camcc-sm8650.c
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
