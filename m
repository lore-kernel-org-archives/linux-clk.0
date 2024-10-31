Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F7C80BF8
	for <linux-clk@vger.kernel.org>; Thu, 31 Oct 2024 19:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730401324; cv=none; b=hwpouMqkEFVuF1U8L84ildTAVBiBmjizG+unpGq0P593Otw0X/9+Pvs0Wx0GkLb79i+uJoR3ySJmKO13jnsvsdq85zYDvoTMeq5UjLXgVJaS6Sv1dJ66VdrEwiYYZCf9MYIVuMUFIc2dzVcA63ZnYrcTWfb2+Yftpqxcw7f7pjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730401324; c=relaxed/simple;
	bh=gbJYUdfgCKw/rRKOhbMx2szkGQp2Ixn9Fkw/N9wbhGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JipkdGgmPQswqHkStHX8cMExHg01rmNpZayVmKYNLu6371UbcSc/+8ixWqzcawIAQxRlJTCwgCCGHRIirsvpqKzH7ar5GdRC6fCk6N+Ej9URNfcfw5VC1H/oMy6cjHmadt/Zu5wt99SML4KAVBFDPa38RCjxa8048FJSLZKubmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xsU8tOaO; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xsU8tOaO"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2fb59652cb9so12774511fa.3
        for <linux-clk@vger.kernel.org>; Thu, 31 Oct 2024 12:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730401321; x=1731006121; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8wAnENA8ogJfTOc3zoMO7WnZA1QX8UI1GpRKP5HXdqQ=;
        b=xsU8tOaOw5LczELN0EGTbxWFjBI+wXmYQrzTvEJZ5bOki5BdoreNP3xNSj0/fZ/oJ+
         NRoJvDg/5nuFSaBHqDkfY2VbBakg9ZKs9seWYqxIp9rXJGlcSI8dtH68h21ODGyCDU9n
         bEsx6dfFj1tkgRSXVj6mnzyHD6kE/QyDX0cFSNh492PLxWXZiOXI1wPDn8AwiV/dfB+P
         Ww/vHWVxjnnisaUuGnlhev4kKKC8EqtxVbCQlByB1/pnY0UPknh2zSxpAzBLze6bmb1H
         VhWZ1eEESnEQU82h2txp5MiO7u6aPJwm+rfrBCbcLGcfTnzTgphuhl7zf2pZD14KbMW/
         zttA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730401321; x=1731006121;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8wAnENA8ogJfTOc3zoMO7WnZA1QX8UI1GpRKP5HXdqQ=;
        b=RvUOktx2IZk0EDq22bL961OhldxdIakRSfhY7OcLHN9129m4YuUWX+qwmA85pCMY9f
         hboqQr8hDY5e8mzBYP3c8nVr9bskeJw+54VII2FtQzs/YLdbuHEKkv6dAiXGU4luRnau
         Ew8xU1nmWo69I0n6mLC07oYo1DSmtZP1wzsYPRS539/RMyWJP5KAwwgGmK0Dd3yVKl4G
         9DOSkiNa+9VjLY1bxjXkGl/w2ExNHoCZICiPmc4Rl6Jlq4Q7TLdboankDFz7UIJe/EbC
         v5snwAYz35J+Q+XQvXLAfszY6wYaGkiXa0XUTZn/AGdBtUB/zar4qwrQqKU3bvf/fJZx
         JQXA==
X-Forwarded-Encrypted: i=1; AJvYcCVbx8TMXw80XYYbN4+4oqUyZ+iWhzLKKKSONFu7xbkz2qQWqVvFUZ1NIB0RmJU06+QwQdU54sSj8II=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3h8AUOGz9OgNmDpEFMHtK8jbpCJW/wkuke4egRqlbYwktdgfc
	ZX8x17bcgfPGoF+uRKxAkJ3r2ulduNa8dJsvHn4YJ3Z+rKUa2rAuvXKnEPbOyI0=
X-Google-Smtp-Source: AGHT+IFi5F4lkwKY82nrXE+8A/PgvuukB0g3gFwNfuoaN/1U/pVNyOoFpOy9Uuyr9977lLV6rh20zQ==
X-Received: by 2002:a2e:bc13:0:b0:2fb:6277:71d0 with SMTP id 38308e7fff4ca-2fdec8586b9mr24132641fa.22.1730401320540;
        Thu, 31 Oct 2024 12:02:00 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fdef8a6410sm3035011fa.97.2024.10.31.12.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 12:01:59 -0700 (PDT)
Date: Thu, 31 Oct 2024 21:01:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/4] clk: qcom: gcc: Add support for QCS615 GCC clocks
Message-ID: <gg2khw4ekb76uikyp2jlvl2bitfovr4grjfqw3wj33jnv5qkwr@p5ulhtixc6b6>
References: <20241022-qcs615-clock-driver-v4-0-3d716ad0d987@quicinc.com>
 <20241022-qcs615-clock-driver-v4-4-3d716ad0d987@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022-qcs615-clock-driver-v4-4-3d716ad0d987@quicinc.com>

On Tue, Oct 22, 2024 at 05:22:53PM +0530, Taniya Das wrote:
> Add the global clock controller support for QCS615 SoC.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  drivers/clk/qcom/Kconfig      |    9 +
>  drivers/clk/qcom/Makefile     |    1 +
>  drivers/clk/qcom/gcc-qcs615.c | 3034 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 3044 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
