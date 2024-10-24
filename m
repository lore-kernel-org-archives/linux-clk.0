Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF1C1FDFBF
	for <linux-clk@vger.kernel.org>; Thu, 24 Oct 2024 19:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729799017; cv=none; b=YAz1STMqu10VBfvSagstR92ONHYz5azv3YRn6GxYWxSQnO6Qen98spvmduX88C/WEfhMlbSkFxwbOeAvaF+SPxr9kpxNmVVVDRiFpSn+pYKCUU8Qd3mOEv+ho0fEL8T+qmY9zJKVTGb+2s8zywo1v5H9a9p+9zeAhGishq9MjXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729799017; c=relaxed/simple;
	bh=H1S2u//xJtJ6QkESGaS9F+6qGkp25nA8VG7jKdC4S8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ePJFaUGpZYODvkfi9+LlL7h6GiJKX6MuKR8TxPldAkG/jO8zxdCy8Z60+P+Ys3CbyTrQ7SKzTJc52SAAdSE+nA20G8H9RSNPM/771YmvKuxBiby+jBIgFzxpgX8a8YPPhuRIwjfoZvz+yT0NsHrGPCEc1uAEH3rv4jzf4oGcwsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E5PHkDOG; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E5PHkDOG"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539f7606199so1731713e87.0
        for <linux-clk@vger.kernel.org>; Thu, 24 Oct 2024 12:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729799013; x=1730403813; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KueSS+4AWd9h0f/ZsLs1oTryEUj0ykGAlyAv7GAvCLQ=;
        b=E5PHkDOGXr+fVaCSy9/hvJIsLhrUJ1637zHr1ge+xAE1ScSq/eYOi6oqmactcgMrDZ
         vt7SH4G1II33MB59lTZ6HvjTwMkLpygbbpQb1MV3nC1KL4pLKuqnwbVltWzo/N9SkKCz
         CqlE5yYSFqBhp5wZPVDHVck79qAToTiorm5WG/4ixH2h/J4oPf1jlL+M7OrViv6wope7
         EGlcEkxjolmfcUAWQUEnE9wOs60OoGsKooSv9QCpoGEWTlm8f2sGsRC2ChGdD6FG6lph
         3wFHfKpOsiO9sQz5XLyJF9/NnN/v+mlbs8TPqfswL5g+2WiwG1KRvQCsleuCn45ssQ0t
         mxhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729799013; x=1730403813;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KueSS+4AWd9h0f/ZsLs1oTryEUj0ykGAlyAv7GAvCLQ=;
        b=MtkB9vSJuEQrXICEd/e6uYbIN0mWk6+Er13yVoex4CsggiX2xyFFmPdDB1M+g5tsBy
         FKDME8KFizG9dT6E4hp/fPfu9J54U23lsFJa7COuLNewRBVlSygHjs+j7PEuFHr8AlCA
         Mnqah4Q01saBaSJk+LB+uysG82UcczkHXi9+5Jkes3n92P0ZVyLt/UoEgUFfTTSy+Ehd
         jZrQ5i6CpD9ulY4BO254MVvWwCsd+kO42jmUn6cr3atT41yomqk1/ZNep+Bau1JbASyj
         DoJeOFEkWw0KQjBOugYgyO67M0NnEkYXoSNsRfKSl9C1ROxh2riVw9pM3jnzRX7noalh
         kzjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVO9kmZSu3+bHbjx1UumaET8odaIrKaP6ki4Y4NZSsFoHb6lAeQ5S2Gct4asVJpEpA7BdVvHy+ZAQo=@vger.kernel.org
X-Gm-Message-State: AOJu0YysxIz5PohXOVy+QFAm/gW1jFfjKZDdtdr76wTkeCqKtnjfB7nc
	N7y7MIgjiB8bBy9mlg8pZ1VqcSphzhN1Bt6l+UwEn7P41fo2LztJktQY0AKrzgc=
X-Google-Smtp-Source: AGHT+IGgTCim3FhEqwvEUIIE7Oi+YsRLJCiWYwiW4+XEg5tv37unJCVGa6dkJxU3YvpEbKPe7cIk8g==
X-Received: by 2002:a05:6512:39c4:b0:539:e0ee:4f5f with SMTP id 2adb3069b0e04-53b1a30bc4fmr4121836e87.18.1729799012562;
        Thu, 24 Oct 2024 12:43:32 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a2242002bsm1460034e87.153.2024.10.24.12.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 12:43:32 -0700 (PDT)
Date: Thu, 24 Oct 2024 22:43:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Imran Shaik <quic_imrashai@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] clk: qcom: Add support for Video Clock Controller
 on QCS8300
Message-ID: <pdelgdtn3pzj57maxzchf7vk3abmx62ob4jikxi5h63o6hdmmd@knjhkqiowfxi>
References: <20241024-qcs8300-mm-patches-v2-0-76c905060d0a@quicinc.com>
 <20241024-qcs8300-mm-patches-v2-6-76c905060d0a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024-qcs8300-mm-patches-v2-6-76c905060d0a@quicinc.com>

On Thu, Oct 24, 2024 at 07:01:19PM +0530, Imran Shaik wrote:
> Add support to the QCS8300 Video clock controller by extending
> the SA8775P Video clock controller, which is mostly identical
> but QCS8300 has minor difference.
> 
> Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
> ---
>  drivers/clk/qcom/videocc-sa8775p.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
