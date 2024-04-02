Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C895D72B
	for <linux-clk@vger.kernel.org>; Tue,  2 Apr 2024 10:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712054446; cv=none; b=K4qx0XoEX/VkCgSdR7EjbYbGMgGsa7fLUX5nO64/IngNdBADiKs1bINuCtk7JoMZokMWpm3TuntPdAQTu2RyvzfCW/hUIczgUfKEuoZU+jhNKxv+aveM+7reJX69yek54+RUG99cbmbOOv1mleqes0Na4pn3VOqatKiziOtEF34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712054446; c=relaxed/simple;
	bh=UsPusJ70z/hTGNwQRA1c0DtkXeRzoz/bLJ9nq3UmtYo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HwW8RjJP1pnobj0kG0oWeCKyqvRnVOqVu9O6fCPF5WCSxHpZoHstTpX5J9YxYktYat24NVPN7SZE1GOvvnooQLywfmABC8uDu9M+tLIGfTv+GsYtQ5xZaLLv/5OUOsgmt3JjSXaR1oduMvQYNQj5gXMr6RQ+IgY4Ou/ywBXfUlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GE9/grAw; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GE9/grAw"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dc74435c428so4777898276.2
        for <linux-clk@vger.kernel.org>; Tue, 02 Apr 2024 03:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712054444; x=1712659244; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9PYIxF4j0xg6PPKY6bKCHDAb7yDnCos1Y4nrGksgbb4=;
        b=GE9/grAwXjS3vyGcP3xO2p7aY4SQE7kknB7whhEJj+RZknboC7Fkvp5M0xLcp1w1YF
         9VpuKcerKq53qlB3n6JQSIHAjOlswb4uYVhXhsR6Ja9wE/rPHMag0KbrooFWPEMq+hLH
         P7hhUzKBJNjEmLbY+0YEbZUL/slxVBYtziKTaXOC98GLtnQuknFdZYcC58bEU3+fj+W2
         IWMHarmeQM/wegnsXs/iykS1bPnSwd1fzwdYT3pVsAfNRgxk2Eitfk8A7n60Oc/8jjkj
         5aK16Le0kSOPc7dZXxF6fxVp/iJlt2UiWq0n4uKZsaqagXfsnZfC1fXvzH/ekK3lzCGj
         xzbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712054444; x=1712659244;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9PYIxF4j0xg6PPKY6bKCHDAb7yDnCos1Y4nrGksgbb4=;
        b=N65gPvdj+SOq4KshtMjh1UKGkvrSMjhaDeP7pqYOd8pjKrIEOXjJOPH23epBzE0Fwk
         qxUQEgp2aLGGLYVlQWGxRtIt8bepOpZB4qwh60V3WskisCGh4Cki0k3iCBs5Hsp8+sCL
         AqWv/MZrgvsKBq1XXPs/YfCBbMdjoNSBVt64GxRueJAWH2zWJR4szuvIBbZUVDtlXj2P
         VmDcMlWWRSqFbJp6/wrvNuHNGRgQP1ThNPXkyzTEpK3wbA28i48xe7J347Nzu8gr+/0Z
         M1+oaK/yUk5WC7zAp82sOvLejUhCwdj2gwyDmdU/Va4qWJ4WiF7syRlMXFCA70RGqjZL
         zheA==
X-Forwarded-Encrypted: i=1; AJvYcCWeqgKXkfDXfhHrK3eudeNI69Y88ZYf8GlIKcOecHutZ3RqeVp4xGe+di/Bi0rT+rFb/9HDjgFj7sL+6ROuW4+Y0OkDrW49az8p
X-Gm-Message-State: AOJu0Yw2uUx2qDTSnijPRscRlSj5t3O0yUlhIRmg/D3ahS/z4tjFkwUO
	znoc/fjffqXq0GLR2Df9/nf/9CCvu3qudwkrAkq++ceyVamyu9vu+1Abw3Hzq25Ws2V18qwqX5M
	Fx/d7Subb4p5vhjbGBh2FFGLSPKRwA6/mQiryfw==
X-Google-Smtp-Source: AGHT+IFJm9l+G9UEBddm5xRcgxHteNtcPg5V78UGOHmM+aa84AtnvwUHGqb/sEXQfiCIWlOZaAm0r9DYyPYH6p7uu4g=
X-Received: by 2002:a5b:ccc:0:b0:dc6:de64:f74 with SMTP id e12-20020a5b0ccc000000b00dc6de640f74mr9783364ybr.9.1712054443883;
 Tue, 02 Apr 2024 03:40:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240402103406.3638821-1-quic_varada@quicinc.com> <20240402103406.3638821-4-quic_varada@quicinc.com>
In-Reply-To: <20240402103406.3638821-4-quic_varada@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 2 Apr 2024 13:40:32 +0300
Message-ID: <CAA8EJpphk_kqzBE7cKb73ipdpTi29t9ZSOOdSfq7pAGSs5NKeg@mail.gmail.com>
Subject: Re: [PATCH v6 3/6] interconnect: icc-clk: Add devm_icc_clk_register
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, mturquette@baylibre.com, 
	sboyd@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, djakov@kernel.org, quic_anusha@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Apr 2024 at 13:34, Varadarajan Narayanan
<quic_varada@quicinc.com> wrote:
>
> Wrap icc_clk_register to create devm_icc_clk_register to be
> able to release the resources properly.
>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
> v5: Introduced devm_icc_clk_register
> ---
>  drivers/interconnect/icc-clk.c   | 29 +++++++++++++++++++++++++++++
>  include/linux/interconnect-clk.h |  4 ++++
>  2 files changed, 33 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
