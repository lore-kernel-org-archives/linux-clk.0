Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2491D6A01E
	for <linux-clk@vger.kernel.org>; Mon,  5 Aug 2024 07:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722841780; cv=none; b=khnYFTV76O7qj/xhXlqmB7TlmFMzRWyiV6qWamy8dOjvQTL49RZP/k606a68L7tKxPGbpLoy/yuP7+8kcKBsMOn7E8eXqpZpYwTojlhQ3UvLcttEBCWfxf2h8oD4SVMaAnr7AnZVEy1/1+CEqBd7wK9zSf6snZxMNNnIX1wNdmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722841780; c=relaxed/simple;
	bh=yVwcVD7Xn+Cm9X+VuSEAjO29KUBpGnrQh6fHfuhfBQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MiPL7tboSwZ9BnCpT9XB2hmafH77q6pEUdmrxH1nUetAsRilkkrz10r7Rataj38NVbR5lV7EnuAg3bhCOJPdLrDwcumAopPV2PU5ciMo4oEnvdIS7xipyLl/VlcJ9UlnHo8p6ebKd42kReS2KEoYqL63gJnnlVRzP92MXLftIfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FWR6pc4W; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FWR6pc4W"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52fd0904243so880140e87.3
        for <linux-clk@vger.kernel.org>; Mon, 05 Aug 2024 00:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722841776; x=1723446576; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dhjgNoYXL6CCBxOF23Z0ViDRqzy0AERmoqKNZ6NN4s0=;
        b=FWR6pc4Wda7LFQ8Ma2VtNJLdcVaIn7p7h0CoMk3J0A2Jiib/nNoOnZVXnsxdqibe0T
         1umO/HhYkVJ315/VD+VMfji06quVEYEp6tRs/aNAfJ3Jm2poD3BKZw9vH8OIjLfkcEF7
         mpzAiMxwHsBCOhBxPqGRPO2/0FLUMY9vZc3/TI4KknbfO/PohSWAlpZLxESOgpOi57XA
         rPIFS8+tkdSTWMJf+98cVE6u2n1vQn8w0z2GX0joUHrwXXoiTouFu9YPN+JcEd3eBQxn
         nmwsDVAzyULOPebH8EngDkkiQjacKJ46AxS/wmveAy/EBvb2eSbvo18U8o3pavEQd/hJ
         iRgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722841776; x=1723446576;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dhjgNoYXL6CCBxOF23Z0ViDRqzy0AERmoqKNZ6NN4s0=;
        b=RbXa4wNhHswt+lcEQkpnrGulbYfoCEc9DIINuRo6KT0ijv3Dhb2gUwRAq/WQ+b5Xyf
         viZ/4TOcEiG+uodwsVSy+YA+M/0GMAfsZKWe82CLNWLBbik31Q3tAfp0ZseqB5XSCJMN
         Y9nIIBDtEC1OZMKxOUaveo0je3ffQv83DsoPcLz+mR8Uxntny3/SZgFBA8wz8fd5HATK
         5s/aj+qS7XIspZ/heZUPMUgZgE3UiBufgx+0AvZTj9yQE1kTeM6QI7+LFVYweI5EMuvA
         Zszv2j8LWd6dRQFXYxsCzHA1RdDYpVxdQ3sdLcHo5JFK5wtlGq6oCROz+2+q8HRvpJKk
         0S0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXfDO+TJAP5bpFSkiNnpSVPm2VR3Qg0lrzOM2YIKQHPxE9HY6eeXPT7TTBwyTzHWC/cGJnaDGuuYWxQGrPHjKcVxhFMAiBUI0t1
X-Gm-Message-State: AOJu0YzviBxN9wjYum/41rtNHenf3cl0c2B6efs5Rm/yYZWUIcMmZG7T
	uNL9YPXlTJu4AEEdDOh1CmjazU0fTBV+NAfqwvxk1A8HhfKbZK0gVqJt8BHi1CyuE0CiKTFWSa4
	2
X-Google-Smtp-Source: AGHT+IFD9+QWaaf3rFR05ekcR9D6RVYzcShU82Qk5i/JTWIVasuFslXHM6RL1NBBFkMkpdGZ8j+uiQ==
X-Received: by 2002:a05:6512:2811:b0:52c:ce28:82bf with SMTP id 2adb3069b0e04-530bb3b0e3dmr3983699e87.5.1722841776156;
        Mon, 05 Aug 2024 00:09:36 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-530bba1102bsm1028530e87.97.2024.08.05.00.09.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Aug 2024 00:09:35 -0700 (PDT)
Message-ID: <52cd30a1-78f8-4b12-8b33-eb33598b6812@linaro.org>
Date: Mon, 5 Aug 2024 10:09:34 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: camcc-sm8150: Fix the camcc probe
Content-Language: en-US
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>, kernel test robot <lkp@intel.com>
References: <20240805063049.446091-1-quic_skakitap@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20240805063049.446091-1-quic_skakitap@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/5/24 09:30, Satya Priya Kakitapalli wrote:
> qcom_cc_really_probe() API's arguments are updated to use struct dev.
> Fix this function call in probe by updating the arguments to use dev
> instead of pdev.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202408012234.vggzO9in-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202408020044.PEGwUAFE-lkp@intel.com/> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>

The problem has been already fixed by Bjorn on clk-for-6.12 branch, see commit
e997b400c846 ("clk: qcom: camcc-sm8150: Correct qcom_cc_really_probe() argument").

--
Best wishes,
Vladimir
