Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48F617741
	for <linux-clk@vger.kernel.org>; Wed,  3 Jul 2024 10:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720000959; cv=none; b=I7KrWdMxLTjqOMJAD0OQJ+55G3NmIZQqutwAD6R6XKYvcVSxanslwoaJS+OR86lODYDS/4DOl2lVoY6r2zCd+bjS8sRgpUROAmJpn2lOnfImH4ruwbOm3cLESe0axWUM2lFcxthY9taEfIFOvbILy2Hj8VKXo1irB672wXyzkXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720000959; c=relaxed/simple;
	bh=10Mu0LIhKDTYtSfcuq6JGEEaI5HtHH/2L1wNR2pXhHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bUeouQM1PxeOHewfpHt0duTJBlJ+L9Ii5lXKFE6y8JMF9jY4fbbZ2uWo/hEaWRPPm7untZDftnqWuMCVS8ite14/3N/UII7YGwYVxmdC8b3q9EO0YC1kMbx0Sq29Y/lWkOIK26Lkh0QtEIMXuGjulRlGAPQu79XAnVApaqrPK7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ReHHKmDg; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ReHHKmDg"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2e72224c395so59404161fa.3
        for <linux-clk@vger.kernel.org>; Wed, 03 Jul 2024 03:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720000956; x=1720605756; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9pL8DbkCHgymdSkljEzIwaY+82euVKxIINYVvOUjWCU=;
        b=ReHHKmDgiAadlzOBLr50T27b18+xD7fcsZ0JWb45pgP0PfhJY+/w6eX+nZAlqa7Ewn
         qAyyxrsAY+pZxb7lcBavu6wWxKHQVt/VM/4WVfqFzguLUrPZmkxLo2gmP0wK+JQQLFvg
         8/ngB1mUEuGeny8jaEIj/gbXpzuEjRqblDlxYMQYhXnQNZX9KuQTzo9gcfg1Y5MnMIpO
         BMQVRKsRBeRzGw38A2AZdenRzvTe7JZY7jij6nFpzmNqRGOiM6N5SlWPqVn1PrY+D8pu
         IhC4NZR4Az3kugdXte/1wDKeGZbozKLU4fkMgTa6pLSCNqWZeJ1t1KSCJ1AwxiwQnweD
         hpRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720000956; x=1720605756;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9pL8DbkCHgymdSkljEzIwaY+82euVKxIINYVvOUjWCU=;
        b=klFmzbz8sA3g4pb2pAiTJddGuxt0Knh8EqHo5XI3wWz8jb+NfXIPjcybrFI+aHTWX2
         DwCECvE9kuJfft84zgFDXqCdKMs1mtxrFLxRD/qSoXavJ/XgCsUHjUX4QWY5q7QjbcdG
         3OWEuqRUgTjhvJ27SX+Uy+tocCklXpKKEBYHLaRFAZHGmHVeL4pYTIX5YXaNPoC5BDmM
         lxLtBgVI0Z/vqMB8tfncNbq1+Lc6ojUVNLV1/xENhOdsAanRc0Ej1oUrx3MsTWmBFsCB
         b5lh1rExobD0BHjPgmXRtZaiIqPuu3zPomqGch+EKrJDsoozNtvzb+u7AuB/IYL0GLIa
         V7bg==
X-Forwarded-Encrypted: i=1; AJvYcCU8+AEQqSViM9zhBVWA8OavFYrBLHfMRhYMnryyAnAJxk3uI7KYCJi7mmOBi9ToJfQN/uZ9y3ygEFIUkCabA3g64ashnE0Nqy4a
X-Gm-Message-State: AOJu0Yw6FmHTOZ9ingJuKfaBXWnWTHj8cCOBARKrhUmD81r12144Li8C
	jlS2PS+F6qS/n9caM/LtZpZuJ38KjKJjzA3NCXvsQDOMI1RndR09kpin1RqNX3c=
X-Google-Smtp-Source: AGHT+IE/GYi8OYn4QCZxmJ7Okzw9g5+fbHAXWRqvNbmCY+VpnWF1LZ/N4KxL8LKQwszZSTWHQsoeAw==
X-Received: by 2002:a2e:a1c5:0:b0:2ec:4eda:6b55 with SMTP id 38308e7fff4ca-2ee5e6d74c4mr67198081fa.50.1720000954067;
        Wed, 03 Jul 2024 03:02:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ee516802bdsm19370891fa.84.2024.07.03.03.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 03:02:33 -0700 (PDT)
Date: Wed, 3 Jul 2024 13:02:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Abhishek Sahu <absahu@codeaurora.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>
Subject: Re: [PATCH v2 2/6] clk: qcom: clk-alpha-pll: Update set_rate for
 Zonda PLL
Message-ID: <jni3b6l4mw6aismxxytzlediepitakand5m4dkqy6diwnmd6xu@r6zaslz722ed>
References: <20240702-camcc-support-sm8150-v2-0-4baf54ec7333@quicinc.com>
 <20240702-camcc-support-sm8150-v2-2-4baf54ec7333@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240702-camcc-support-sm8150-v2-2-4baf54ec7333@quicinc.com>

On Tue, Jul 02, 2024 at 09:20:40PM GMT, Satya Priya Kakitapalli wrote:
> The Zonda PLL has a 16 bit signed alpha and in the cases where the alpha
> value is greater than 0.5, the L value needs to be adjusted accordingly.
> Thus update the logic for the same.
> 
> Also, fix zonda set_rate failure when PLL is disabled. Currently,
> clk_zonda_pll_set_rate polls for the PLL to lock even if the PLL is
> disabled. However, if the PLL is disabled then LOCK_DET will never
> assert and we'll return an error. There is no reason to poll LOCK_DET
> if the PLL is already disabled, so skip polling in this case.

Two separate commits, missing Fixes tags.

> 
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)


-- 
With best wishes
Dmitry
