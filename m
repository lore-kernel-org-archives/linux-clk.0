Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854DC2185B8
	for <linux-clk@vger.kernel.org>; Fri, 11 Oct 2024 13:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728653831; cv=none; b=OkYTAXu7qQTJc+C//Zq0xYBrtdACAohOiN8vFYrmFuQtdSzKTS9ObU487YWZoOJBW38HI9T6EZ/jKsVI9rBv1WoaChZJGo1EAkvUUvxTRhkQcaF+HAKLzFu3HUzEKjoLEoLp5ncN3QUTpGHXCHpI460e0WikP9auHvINMEEIVnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728653831; c=relaxed/simple;
	bh=cjMGxQOW5XddUAB+/xLXi8oiAJnn8YXWVX2jh465DMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z3Sye+0TN06ApNkTTsSGbdsyoVGuTmJIQKKPsU1hWA1wWF2UwtQ3DgyNqaWrM1SFs93FTMf5POuuExMBwTLC1aCQK0bTTqyESDbHp1SrjWfdE3/rgNHcsNA3beW+3oKo6Cp8EXKxSL2cL/+j0INFABGp0UkJ1RLPs79/kppX3Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RIAZ5Sxb; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RIAZ5Sxb"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-539983beb19so2467421e87.3
        for <linux-clk@vger.kernel.org>; Fri, 11 Oct 2024 06:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728653828; x=1729258628; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XaGfDqX+Jbu8yXuoPx2CqSC4Xq+Wq/cr4J5BmFZrmFw=;
        b=RIAZ5SxbvncvdpKUP/SDUacSGr4cZ76tCLsLwt5IfSN/0xgeENHW5cfkO9eMbep2AL
         NkQ3h22znylJqb5pS24FTBJfjyjfWoVP55Ba3a1sFvDQThgaSdu8uh2jSEsmpHm22pTx
         U+SJ3gAFmqadfOKkQRDTpJP7q2vu1/08KfvbqQAUQ6+eKs1i2VZCTLilzM+PgX/MYGwz
         sVy8s3B6Yv39IYlJfzHnyYYE1iKkLXbifzvu0PnwjmezWcT8F/5M/U7XzJeY3NW0deJO
         7RN2FXoShNWNm580m7agcZ9UkGjkWej2u4XNc3VibZ5wy1Ip0bYqwu3nObJ4ozDSKH61
         mQsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728653828; x=1729258628;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XaGfDqX+Jbu8yXuoPx2CqSC4Xq+Wq/cr4J5BmFZrmFw=;
        b=YB7Qi7/0gGSDk6b9KJWkIbMeLWIgrdsMNg/rndBOPKHHQeR/DKeBkR7LUXzpg1S5Zd
         W16B+MsqYCWoOdzFBoQom7PZEDfE2g7AQLKKezC3Rq3fPY74Czs4nz5r4+n4hiPlO0qo
         fAi4IGZ7WuM+PDkE5Pw4+XhwUoSHvUxexyMpJre8kiNLR9uMSOaxD3hoD5Y+u4T4tDAF
         5QuljWMjGgASA0fWTFzJQI7SCV9EsJa36Q6Th+7Ltrw6jr6x0NDlHpiT8sBfLq+ZpcsO
         7QdhDSKoIVOML00hF3fMTUYtv05byvA9yCc9PSZu+2WJ7a8Q8U+Heh5MZxGyPCINNUDN
         0P1g==
X-Forwarded-Encrypted: i=1; AJvYcCUEFVINHHGOzLUBCmqSu9YFx7SQLgOgA3A59wAeVWM0Jqt6NyW9Ppw/jh5fHZm27hPcMVcd45JS6uo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoGU0G5N/hk3lAkzznUwnRSDjknEl33IrNEhXmNmVQpqnRGxjW
	Zbq1xjZVwzP5PTEn/7hin5o8rF+IGb/reHf8SZ0lGyh8CdVLy8gRsmCZaOpcdaE=
X-Google-Smtp-Source: AGHT+IG3qL3pSC1dHQpXFWaYB+Rn07Kp1WBxWezdJxQFyqZIdB2oubsLQBMVJh2zhElcrmtmyeK9EQ==
X-Received: by 2002:ac2:4e03:0:b0:536:553f:3ef9 with SMTP id 2adb3069b0e04-539da4e0b9bmr1361860e87.27.1728653827760;
        Fri, 11 Oct 2024 06:37:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539cb6c8c9dsm599131e87.119.2024.10.11.06.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 06:37:07 -0700 (PDT)
Date: Fri, 11 Oct 2024 16:37:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Qiang Yu <quic_qianyu@quicinc.com>
Cc: manivannan.sadhasivam@linaro.org, vkoul@kernel.org, kishon@kernel.org, 
	robh@kernel.org, andersson@kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, abel.vesa@linaro.org, 
	quic_msarkar@quicinc.com, quic_devipriy@quicinc.com, kw@linux.com, lpieralisi@kernel.org, 
	neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v6 7/8] PCI: qcom: Fix the cfg for X1E80100 SoC
Message-ID: <u6n2u7d3sxcq57hfyrbqri2bqehuogdaof6qe2uh7qela4pihy@7mhyjayiucmi>
References: <20241011104142.1181773-1-quic_qianyu@quicinc.com>
 <20241011104142.1181773-8-quic_qianyu@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011104142.1181773-8-quic_qianyu@quicinc.com>

On Fri, Oct 11, 2024 at 03:41:41AM -0700, Qiang Yu wrote:
> Currently, the cfg_1_9_0 which is being used for X1E80100 has config_sid
> callback in its ops and doesn't disable ASPM L0s. However, as same as
> SC8280X, PCIe controllers on X1E80100 are connected to SMMUv3 and it is
> recommended to disable ASPM L0s. Hence reuse cfg_sc8280xp for X1E80100.
> 
> Fixes: 6d0c39324c5f ("PCI: qcom: Add X1E80100 PCIe support")
> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
