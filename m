Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6F42A1BB
	for <linux-clk@vger.kernel.org>; Tue,  7 Nov 2023 21:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QCcldNw3"
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A26110D5
	for <linux-clk@vger.kernel.org>; Tue,  7 Nov 2023 13:21:19 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-507d1cc0538so8323387e87.2
        for <linux-clk@vger.kernel.org>; Tue, 07 Nov 2023 13:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699392077; x=1699996877; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TP91kUeFUdw5BHZzOadp5Ri1kmnZ7KqGB8htiz8sgvM=;
        b=QCcldNw3mN3z0Z8vUZCd5DNeglbPRGEEkhyOXF9Wpo2HF8ts8KxTp2geNmnwtDJszr
         3/juF4/yhivoSZNtL/r0Oe15snGiUrJq+6PcohgCMrhXjEG15ocxHNplTYogBc0qf5kT
         M0ysQKEju8xvbOK+BuaG7lQlljwwVN1yv+NPokJtZLsG3s1pXVtRW0y/QEYke7HT2mvC
         w32bliZ6S3gkqtazxwzuAZ7Tr4ZGPXMO0scVx8Aw1eTrkuWGrSkx2P99yQA+IWQEcm2N
         xd8rvt//zoXivVKs/Z3VjQDGkhN/dKq9t/LR7goPKAtJ7LiLsCOImnkovefWQR1MbFNt
         LRww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699392077; x=1699996877;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TP91kUeFUdw5BHZzOadp5Ri1kmnZ7KqGB8htiz8sgvM=;
        b=aP6VWdRDb8e0r5BYRM765S4tpiDo5Stw5mIc+OapNO8vJekffCdshQXocZ+8NPRNdT
         IiK78n9QWJpQM12OUWvgu/V/wPi1MmxqoSDwL3UJd8LiogWsaO5PDvjM0wPcF9ClgVr5
         UTe4vXwg4Z/eZA/oOp/3t+zWZQznE7MJ1W3127sdlYyLlPe26FP4EaCvE+CE4ebI25W8
         HX27UXNH6ul2XoHbjwiAvWSZ96b5/EdMcWf5hP4z/Kdl5ppwua5lQo9ad/7LUFsohIVa
         6SiUFR4YYiw549xGb87Phnc677BnkO0omppeeQ6W05qez8zJExsxHnzaG5a8MogQoq2g
         1Sow==
X-Gm-Message-State: AOJu0YxSSsh5in/sHmyaU/ctvbv6xGxaW5g9sP7kRfPGiLybn+kP0Ga5
	YVa4vAI+ddrsWzSX6wsszCjp3g==
X-Google-Smtp-Source: AGHT+IG28nfpF/t/GwBx+w4KQQPZXMRL2WGhzbKjj0Jgx7Vh3vZ3wycUfSAG8mv+ArdcXqahB4xabQ==
X-Received: by 2002:a05:6512:358e:b0:505:6cc7:e0f7 with SMTP id m14-20020a056512358e00b005056cc7e0f7mr21874519lfr.44.1699392077343;
        Tue, 07 Nov 2023 13:21:17 -0800 (PST)
Received: from [172.30.205.109] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id g33-20020a0565123ba100b00503200ce35bsm461520lfv.136.2023.11.07.13.21.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Nov 2023 13:21:16 -0800 (PST)
Message-ID: <82a25b12-7a63-4c75-8a46-624bc35c6752@linaro.org>
Date: Tue, 7 Nov 2023 22:21:15 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v3 4/5] clk: qcom: Use HW_CTRL_TRIGGER flag to
 switch video GDSC to HW mode
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Kevin Hilman <khilman@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Taniya Das <tdas@qti.qualcomm.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-media@vger.kernel.org,
 Jagadeesh Kona <quic_jkona@quicinc.com>
References: <20231101-gdsc-hwctrl-v3-0-0740ae6b2b04@linaro.org>
 <20231101-gdsc-hwctrl-v3-4-0740ae6b2b04@linaro.org>
 <835a6add-81e9-42e4-abbe-91632aaa6bc9@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <835a6add-81e9-42e4-abbe-91632aaa6bc9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/7/23 14:05, Bryan O'Donoghue wrote:
> On 01/11/2023 09:04, Abel Vesa wrote:
>> From: Jagadeesh Kona <quic_jkona@quicinc.com>
>>
>> The current HW_CTRL flag switches the video GDSC to HW control mode as
>> part of GDSC enable itself, instead of that use HW_CTRL_TRIGGER flag to
>> give consumer drivers more control and switch the GDSC mode as and when
>> required.
>>
>> HW_CTRL_TRIGGER flag allows consumer drivers to switch the video GDSC to
>> HW/SW control modes at runtime using dev_pm_genpd_set_hwmode API.
>>
>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
>> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
>> ---
>>   drivers/clk/qcom/videocc-sc7180.c | 2 +-
>>   drivers/clk/qcom/videocc-sc7280.c | 2 +-
>>   drivers/clk/qcom/videocc-sdm845.c | 4 ++--
>>   drivers/clk/qcom/videocc-sm8250.c | 4 ++--
>>   drivers/clk/qcom/videocc-sm8550.c | 4 ++--
>>   5 files changed, 8 insertions(+), 8 deletions(-)
> 
> So.
> 
> I'm assuming the rest of this series works however for sc8250 at least this is a NAK, breaks venus on rb5.
Are you saying that applying this patch alone causes the attached crash?

Konrad
