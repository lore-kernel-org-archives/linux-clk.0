Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D88B2918F1
	for <linux-clk@vger.kernel.org>; Thu, 17 Jul 2025 09:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752746273; cv=none; b=pYmK03f0XvapzF6LQDz+q7L42oPEZUkY0PTct0Y8RwysKrpJTxIjehatXa92Qwk+QsAkusEHOQ7yQLHd6Yruk+YkKAHIjIrfsZnHvbgaTb35SleDxy7oMtj/U8I0Z58JQifm0U+AWwvPDZIUCWAszNzYAYbAi3M7uI5QBkcRHm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752746273; c=relaxed/simple;
	bh=C5c7x2+5FmrN92Gtg4+eigW/yNecgUmNAwgsD6/1sDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SHns7ko8xwTSLBK4jYCEBlamiKwvDp1MVnL7dej8SeMRohaWPMpetQ7A8jG6oAaAYUyDejOilqrBmLQUeJP47Xgs1bxjYbiQtEI+aTfW8YIxVlppX1MI8BdHPFMvrOUFT40YPBOO++oXwHXxxs355Qd2Wpm+8mKYJWPhZCXFAWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m005fpLc; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m005fpLc"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-60780d74c8cso1346505a12.2
        for <linux-clk@vger.kernel.org>; Thu, 17 Jul 2025 02:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752746270; x=1753351070; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A9sprcw+FL+M/3WWYR2avdQL7tHTil5o2+4ysJZAMdQ=;
        b=m005fpLcWnAvz0JjkEffvSN+/hoEF9efLY4NGGZa4QIIjkqdTs7VODtbCSKCjqMWW6
         lgaeZhLmotaL897hwGqK5UT2DtrafSo2tocknaatWcJMQFCVlc7C5qfmmpAyg81ttVQ/
         Pw63quyidt44Jmq0Lq9QFxuGMX2NmIgx55Ibz409wa74gN8YQpk84YrXGuwmrmxB/MDA
         K6fRpaFGszLJaShnOKD1573GuGQyMYHlY4bpSDNAI0mDwQmWYrFNc10BYLB356kjTxWS
         aq+dy7hCmn8ZsKY1cpCAD64TBmDST26CC05dpiNRYkBWfNra55254x4B/XJqVeqoS2ZV
         gXxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752746270; x=1753351070;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A9sprcw+FL+M/3WWYR2avdQL7tHTil5o2+4ysJZAMdQ=;
        b=aLqVp+Am5UuvuujR0mtViZ6rV59y2NXk+ECeKYSWg7wwNn1IvEsiN76PkcFy1zK2ih
         geQ+zu/hT4r/bDysTnSbUyfPi6uipZYjZsJh+KHZ8oY8QaPPFLuUyclqi4atrSUBIbI/
         MQfUPsuqs7yhKdu/FmWNhPF65spT/4KDjxsFFoYRYohEcdQY5elZt8ULANbf9hyEHgzN
         LnKoOx4dbl5Ty2qzOh+lJlfZVQZ+3QtKlNyhI5LX85DiQiBk7kDrifDBEto/16Buqer/
         F/f1WGZ3id7FTbpi1EWxLO903MeyKbemA46cvgoyow8Mj+ymMhARYermqD7o0byCMiLn
         F7EA==
X-Forwarded-Encrypted: i=1; AJvYcCUZM4PvtWWbp2j6jmuDIm+KNUWwjSvNv7t0O725Ig6WAldLqVtx99u/X6Lp9abWzxExjDP521tsg2U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgSwTpnpcN1TAL9y26od82ksHbbtFK9FB1F1cVkZAgsg53GLSg
	wcILMuxRfp4SYG/UFMl0fwe/Lk5sjifxGxpqdzAiBzP68Mjz7eeoPQW7O12Ug/0nSjI=
X-Gm-Gg: ASbGnctn+4XO5W3VvNdRj6rau7JS/OxI64WUVSB3hNJzcmVjI5Sp7HG6QyZiFgNMtPm
	9fnkUu06AZOAh82JyOgcttcg5e8NeYxiqJgKvthQtOahu1e7dPQanDLuIYWxVtv0nuvWd6F4MzO
	iIgVQQuiHI0yvVzFdShU0PR8BV+Hp5TkKZw/3Gf/YH3R21u+jV8/3wU71FgzkVkCfF4kRDgNPIB
	0WPGoq20mBvYS2oWj/rhZPUECyil0z2lbMXkGGMIIKzS1cHmWxkxLNPIMGPI8CbZwcN/NGrxQZs
	t1MiuFbDWFu1k9MVU+pnbPSmEdev1shU9yP3hswEFXL2BoXVX9j5r1MjiIOAWhM+pMTtw3NtYGK
	LDTRutnUzhFyLF/Ivy5A=
X-Google-Smtp-Source: AGHT+IF2F1sezQkalvkubfc1kydTpgVG5QuWYuPnjDm/LqI0gsy0QRNYJ/pRxI93KXsHSADKAggVsw==
X-Received: by 2002:a17:906:fd84:b0:ae3:63fd:c3af with SMTP id a640c23a62f3a-ae9cddf1080mr542887866b.16.1752746270277;
        Thu, 17 Jul 2025 02:57:50 -0700 (PDT)
Received: from linaro.org ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82dee16sm1337846666b.152.2025.07.17.02.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 02:57:49 -0700 (PDT)
Date: Thu, 17 Jul 2025 12:57:47 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: sboyd@kernel.org, mturquette@baylibre.com, andersson@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	quic_rjendra@quicinc.com, taniya.das@oss.qualcomm.com,
	linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] clk: qcom: gcc: Add support for Global Clock
 Controller
Message-ID: <aHjJG2nrJJZvqxSu@linaro.org>
References: <20250716152017.4070029-1-pankaj.patil@oss.qualcomm.com>
 <20250716152017.4070029-8-pankaj.patil@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716152017.4070029-8-pankaj.patil@oss.qualcomm.com>

On 25-07-16 20:50:17, Pankaj Patil wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Add support for Global clock controller for Glymur platform.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig      |   10 +
>  drivers/clk/qcom/Makefile     |    1 +
>  drivers/clk/qcom/gcc-glymur.c | 8623 +++++++++++++++++++++++++++++++++
>  3 files changed, 8634 insertions(+)
>  create mode 100644 drivers/clk/qcom/gcc-glymur.c
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 051301007aa6..1d9e8c6aeaed 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -645,6 +645,16 @@ config SAR_GPUCC_2130P
>  	  Say Y if you want to support graphics controller devices and
>  	  functionality such as 3D graphics.
>  
> +config SC_GCC_GLYMUR

Wait, are we going back to this now?

X Elite had CLK_X1E80100_GCC, so maybe this should be CLK_GLYMUR_GCC
then.
