Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FE5194091
	for <linux-clk@vger.kernel.org>; Mon, 17 Jun 2024 09:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718617873; cv=none; b=d9q/vKGD2UA0qV5EoyVaHHdePawp0SX6LgQ20wN0J/MkmiGy82PG6Gzd/KOBjaWYm0tsLVkKVBa/Sykp//JGwAIVlPNfTxRDvNrum53vOIQECenKPcYz61R7X8r4y/gbIKvK5o1EGU5HLJ9683G60hmcLrQh26kh1wlp+UAFY8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718617873; c=relaxed/simple;
	bh=1y73eQPVodwTMu2gDWLc1JeFO6mTtScZeSbIX23T2UU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BIKNP78xgIb6o489mrolWH8Y5RQWLBdkREkr6zNQNXKYgZEqdgG2UaDf97BDUnSVc7YvsxvX7g9gvwwGZnZDHFY07vVhksO+0NtX9BxwVBJXYR10vy6NzDEb0Xxqq5XEBJublgJSxZ0RH+W8ossCle0yrgnPzyFtX0KOXa5x0mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m3bEcuMU; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m3bEcuMU"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-354b722fe81so3748829f8f.3
        for <linux-clk@vger.kernel.org>; Mon, 17 Jun 2024 02:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718617870; x=1719222670; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mJ4Sf0Qpnpg0mNfJe0dZM5ooebC8zr2HkLzZYiJ9KxY=;
        b=m3bEcuMU0t1ZUPPdLrWRWZMxlotDXFbQBtRCwViGnZKuwSbr+uL0ZfYubZp1GNfOxX
         xbaLjzNOh5TYw4p7+PtQYy8CBPsjMs7e0arxigXFQtAmE5XDynMy/LoQoVWb9MVvr7Pt
         qUyKbBALunTzuZg6pNhGS+adLzjkqM6hxnPSgyamvZ+sWi8PBJxry7iXR2N2ConeyudG
         lrUHs2ioOFhtGRfk1+NBiTLuLMDVqOIFHWU6fNmaItTis2+Zij8AV3i3JoZ+eUsVJaDV
         6zVb5lB6Pj9PzQJt0iRMNuclzsDpdvOMXqt4+nND3at4SpWoCLtQHVVA9NDXPEOmjVQb
         DVwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718617870; x=1719222670;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mJ4Sf0Qpnpg0mNfJe0dZM5ooebC8zr2HkLzZYiJ9KxY=;
        b=jTjsi/hG8CtquLCSKytHeMCVq95ikmy8c5Zo8JzSnQbiysNTGSdx0J3JgfPbze8LSO
         tk1Hv/6Mzl02CvwYeZAKa1HSpZkx2NbvS86QJ+bOTiEKeLDraXXjrdaQQRo+6mg6Ila0
         RaN3P6FaKrBMWM8FF6Y+eoeJYeC1+7z3x516EZ4uuow+WR78efXVG87KICmddKGOWAKo
         jmoWweFCFtUEMPlJwpREkxvQ8PmYVIggo8p9WuOsJ/o9atAmXfmFT9f4kcS3h6giAcxg
         ZWffyrJp2WO+ylXnvHJft3WLtdseKKMBQD5S52qI6/Ir7fwkB/LG0p1gwsAIJpMlBvRL
         bjWw==
X-Forwarded-Encrypted: i=1; AJvYcCXzJS0M++OtEo+zTNE1uuGVK0EG1GDz8m8UAZUIDez5SmCMRSCJOW8rgVYzSjtYAl6YRJByvZTwaKze9V6J6BDCYiHWuI/ZZwzM
X-Gm-Message-State: AOJu0Yzrcd9T8KfQG1213uIyRH3ErWWkLT/Jkr00llqhWyDhzoeWI+mb
	bWTid5mabqQsNTyc9DiP7zw08Q7iLie/MadwKqCC6Hut9FT6a5EG1Bq3sUG6DGw=
X-Google-Smtp-Source: AGHT+IG9PUbxCPf1bgdr95dC5Am+XNjIYf8nW+qqKLMvGs09SVCiTZEntEjWJwmp7GgG/3LuhbnIqw==
X-Received: by 2002:a5d:64ea:0:b0:360:8589:37c0 with SMTP id ffacd0b85a97d-3608589385dmr7022782f8f.8.1718617870085;
        Mon, 17 Jun 2024 02:51:10 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-360750ad20bsm11420396f8f.54.2024.06.17.02.51.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 02:51:09 -0700 (PDT)
Message-ID: <01041302-120b-4f9d-87f2-bd841dcd227a@linaro.org>
Date: Mon, 17 Jun 2024 10:51:08 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 RESEND 5/5] venus: pm_helpers: Use
 dev_pm_genpd_set_hwmode to switch GDSC mode on V6
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>, Kevin Hilman <khilman@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andy Gross <agross@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pm@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>,
 Ajit Pandey <quic_ajipan@quicinc.com>
References: <20240413152013.22307-1-quic_jkona@quicinc.com>
 <20240413152013.22307-6-quic_jkona@quicinc.com>
 <5c78ad52-524b-4ad7-b149-0e7252abc2ee@linaro.org>
 <b96ef82c-4033-43e0-9c1e-347ffb500751@quicinc.com>
 <a522f25f-bb38-4ae1-8f13-8e56934e5ef5@linaro.org>
 <dbd1b86c-7b5f-4b92-ab1f-fecfe1486cfc@quicinc.com>
 <621dbaaa-6b86-45b5-988e-a6d9c39b13d7@linaro.org>
 <d36c1163-a3f0-4034-a430-91986e5bbce8@linaro.org>
 <ef194e5c-f136-4dba-bfe0-2c6439892e34@linaro.org>
 <d2e55523-f8fd-4cbe-909c-57de241107e8@linaro.org>
 <1df48a42-3b4e-4eb4-971b-cd4be001ba27@quicinc.com>
 <93a67151-02fa-4c53-8d6e-0ed1600128bf@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <93a67151-02fa-4c53-8d6e-0ed1600128bf@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/06/2024 03:31, Jagadeesh Kona wrote:
> 
> 
> On 5/31/2024 5:26 PM, Jagadeesh Kona wrote:
>>
>>
>> On 5/10/2024 6:31 PM, Bryan O'Donoghue wrote:
>>> On 01/05/2024 10:14, Bryan O'Donoghue wrote:
>>>> On 30/04/2024 21:01, Konrad Dybcio wrote:
>>>>> On 24.04.2024 11:50 AM, Bryan O'Donoghue wrote:
>>>>>> On 24/04/2024 10:45, Jagadeesh Kona wrote:
>>>>>>>
>>>>>>> Thanks Bryan for testing this series. Can you please confirm if 
>>>>>>> this issue is observed in every run or only seen during the first 
>>>>>>> run? Also please let me know on which platform this issue is 
>>>>>>> observed?
>>>>>>>
>>>>>>> Thanks,
>>>>>>> Jagadeesh
>>>>>>
>>>>>> rb5/sm8250
>>>>>>
>>>>>> My observation was on a previous _boot_ the stuttering was worse. 
>>>>>> There is in the video capture three times that I count where the 
>>>>>> video halts briefly, I guess we need to vote or set an OPP so the 
>>>>>> firmware knows not to power-collapse quite so aggressively.
>>>>>
>>>>> We seem to be having some qualcomm-wide variance on perf/pwr usage 
>>>>> on some
>>>>> odd boots.. Any chance you could try like 5 times and see if it was 
>>>>> a fluke?
>>>>>
>>>>> Konrad
>>>>
>>>> Sure.
>>>>
>>>> The first time I tried it, it was much worse.
>>>>
>>>> The second time, captured in the video is only noticeable because I 
>>>> was *looking* for this specific error i.e. I don't think I would 
>>>> have noticed the error on the second run, had I not seen the first run.
>>>>
>>>> I'll find some time to do 5x with and 5x without.
>>>>
>>>> ---
>>>> bod
>>>
>>> ping bod please remember to do this thanks
>>>
>>
>> Hi Bryan, Could you please let me know if you got a chance to check 
>> the above? Thank you!
>>
> 
> Hi Bryan, Kindly can you please help confirm if this is a real issue or 
> observed as a fluke? so we can go ahead and mainline these changes.
> 
> Thanks,
> Jagadeesh

So I'm happier with this patchset when I run gstreamer instead of ffmpeg.

There doesn't appear to be a discernable difference between before/after 
on framerate or subjective UX with/without this set.

gst-launch-1.0 -vvv -e filesrc location=sample-5s.mp4 ! qtdemux ! 
parsebin ! v4l2h264dec ! autovideosink

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
