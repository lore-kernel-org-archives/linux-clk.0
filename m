Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB58C1991D2
	for <linux-clk@vger.kernel.org>; Tue, 28 Jan 2025 16:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738080563; cv=none; b=MHWHXWixGcuecuisfz3VVn2Pjzwmqjdl5/1OMx3I1RrUgU6kCmpEcVMabDl+aGER/pBCvoDC0G7Y6Kjx03iL3YcMJ2Rg+dOh1wms6TunofN4XOgwO3+Mq/hasPJe7MrNuLRo+N4owU7h46RmJ1kgW5nyThCIzM5O9jKXwKlHfbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738080563; c=relaxed/simple;
	bh=BEceo0pyOWNwrQgM5P+ElC1rpnayGRzLlO9HRB1nWeo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FZTUQ+5hbPq4Dkz6LRJsi/1fEO6ZGRCeJcyNhpjKJvskbiMG3EVkshW4Lv63yIRB8ba1hXGj1kKVEQeMiGCAUXMFGFp2cQZkvtNEdYJeBOqPFQsdjtfojAj8mU5dLfqpzFRUrJmt+giSJl5iLEc0w6/litTOPUW0Cos4PBcn4lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dx3jCmkf; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dx3jCmkf"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53e384e3481so5560861e87.2
        for <linux-clk@vger.kernel.org>; Tue, 28 Jan 2025 08:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738080559; x=1738685359; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8hyWKduVNC9ouiWAJq4WnkCOtxjNZB1VnYrFoYk4udA=;
        b=dx3jCmkfR2fG5MyNInak4Wl8/kJyRHvcvDkd+kYwncRIWwuH4O1imGSdVmwdZvXMup
         o8SCsNc7isyz7PQodm1Mpo5ipYDbJ4+fxE9AZRm7mFskRF76ChN2jP7bEvttVRGisCbu
         s+yS9N+sggF3Bj7TbZi7qHvMju42dF736dgNptJvGnbtyDfnC58513UQJ9RLvaqpGdap
         f65GD40Wp86/kbSFQ2M/KTS3V7+d5WrI8/m3iNb7XwKHaBQLBpZCY/KrRGiTLWt5TCdo
         fUHb8eJsouwpYBrogDTh8LgSo+XUJ7FPMOZrkYoxA6bBO0SrfoTQYS4Hsotw7/DZrMxz
         kwug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738080559; x=1738685359;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8hyWKduVNC9ouiWAJq4WnkCOtxjNZB1VnYrFoYk4udA=;
        b=dng4nxaKW8lUVi+9O48n/2P/SocSOfok2vQdZPDDbk58zk/1GW8oCSx3YQ7mvTQFO3
         zAm970YpXapaglkVie+WiRVaUIefTFGEoaYfQWEhoQUjX7vG8TC5U01I7iZM6YfCAeWz
         sX30tb5AwBqUrO34NjDB+IIMMVCJFsYH47kKVlCmQse1ZlSb7M0jv51HFbuy5Yx3Pst1
         ayhL3awjfKYj1Gx6aDWoW0daxR16IyGXXXiFkFQhsnJxEecUeTs3pWrZXj80fesyYENj
         TzdH1+BmkBz/WaQ2b14NGWq/+yGb/irinzOm4//zZRPlIji3hcJOEH62rt+nLUSRpNQU
         KnZA==
X-Forwarded-Encrypted: i=1; AJvYcCUKAFdmfNk8ZmWVpVvTgsIGaNRq/fDsNUtd5vhhLHdKluREtkV/hd3diUCXVJKOy8nin/9qLhYjlC4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPbpiDsR5Xfsq3Zs4lfGHuBLfbXE3OaRjF3r2fLI1VL4jIr4ha
	6BFEl4IxZHbmvSkXUcGn9J0u36EKX9bJ+k+ZYzp5QEtAwV8M+7wmzKQOPq0XUGM=
X-Gm-Gg: ASbGncsyUO/fGiq4HzuzAFvb8hUcTY7iZS6MYSjtf+aSj8YstnI5Ijyt+GzA5E9oW6M
	sll+Uo3FiONdramfliKbvZKpsA4sdNYLsN0NrG/CuJ8/JPG9sAyBjaNTF9soVqRATNFfH1TtFL3
	5571g4Z0Eyv+l6lO7ym4bozzRm9bQs3lEDRzl3FncmjtWPJ2TUEbxDBGPDz05BOh/UvZRx+HNIf
	nBnHiBTwHLSjzRQQg+MRvghNzCVW1eO78QjoSyiqy03nLxCR2c+ww3EcNRc/3MqpyrgdQtMZybs
	IfEZZDbGsNZ0YEKB2MF3nZb+ARsKMulM2YzU0kAz6OUzOlb1zLnU3sPKxK3JvYfH6TEjdwAG0au
	Julm/NA==
X-Google-Smtp-Source: AGHT+IHC2sjROuFhZA0YjUt5mQF/zuLJNR2MX3vLn942u6zWQ2Beugmg5eWKUBTr/IVWHBJ5ABtFKg==
X-Received: by 2002:a19:7618:0:b0:542:1b6b:1e89 with SMTP id 2adb3069b0e04-5439c216beemr12823836e87.7.1738080558882;
        Tue, 28 Jan 2025 08:09:18 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c836840fsm1670414e87.132.2025.01.28.08.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 08:09:17 -0800 (PST)
Date: Tue, 28 Jan 2025 18:09:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ajit Pandey <quic_ajipan@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, 
	stable@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: clk-branch: Fix invert halt status bit check
 for votable clocks
Message-ID: <sfrnlwwmoh5ic5c5r6b3mzh4dq2ud27qu3bclcm4p5vwfbckhw@utti7c4ejxr6>
References: <20250128-push_fix-v1-1-fafec6747881@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128-push_fix-v1-1-fafec6747881@quicinc.com>

On Tue, Jan 28, 2025 at 05:08:35PM +0530, Ajit Pandey wrote:
> BRANCH_HALT_ENABLE and BRANCH_HALT_ENABLE_VOTED flags are used to check
> halt status of branch clocks, which have an inverted logic for the halt
> bit in CBCR register. However, the current logic in the _check_halt()
> method only compares the BRANCH_HALT_ENABLE flags, ignoring the votable
> branch clocks.
> 
> Update the logic to correctly handle the invert logic for votable clocks
> using the BRANCH_HALT_ENABLE_VOTED flags.
> 
> Fixes: 9092d1083a62 ("clk: qcom: branch: Extend the invert logic for branch2 clocks")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ajit Pandey <quic_ajipan@quicinc.com>
> ---
> This patch update the logic to correctly handle the invert logic for votable
> clocks using the BRANCH_HALT_ENABLE_VOTED flags.
> ---
>  drivers/clk/qcom/clk-branch.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
