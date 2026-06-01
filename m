Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6234C38BF9A
	for <linux-clk@vger.kernel.org>; Mon,  1 Jun 2026 08:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780302604; cv=none; b=Mw6LhQqFgb+v6ZYzTky2558qn6WSBiC54PaSY82Fvash/qci5HiVwo7VbY8fpSWugqarQA7d2ytKp7+PVXF0yQmrpIadLj2PcUkMhapkRiI34Axydlgl5i9L6NqU+1PaYyWnHHJ8mfH1F/Cyk0NIjVGXijXJtu3S8TW+FP0YdK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780302604; c=relaxed/simple;
	bh=UwMCGuCUG/G59TsR9qdiEFTMtiemrGM1GHLA+rls0Fc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UKdh3UZKO33Ns40PNVUDgwRvcNuNxsvd9cn592EEnFX78XaUnNbd5ZE9aHMD+HY7ZNrcg8R6aAPJKW7QNMA7xubDWtVoWMCHA/sAuwYpWdYyILtgyL/7Q6NU7Q7d3UHYXxvT6orv0hCBh9+FH7tdJSQy6CQwa2s70gGFRsPfhgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lT4GgwPi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y70QWgMh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lT4GgwPi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y70QWgMh"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518JIQO772872
	for <linux-clk@vger.kernel.org>; Mon, 1 Jun 2026 08:30:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+C7AjW3L/4e0skJ47LK5kmpxZ6SkXBdtEjzyI+WlN4E=; b=lT4GgwPi35xPJOEn
	XEGBJpKinD1t8R14tMZkVO2XlhmEJ9CSJJPR3E1Knp7k+Az5TpJWLjzILODDu7G1
	+bkThFkpkA9KIFBxAQyEyGlXTGp7FDaExgHlXm2GdgYmQeF+0AVu3VrJP2M0rnGh
	Im9cjci/hOIgr+o0fYhuhHlfqJSjjRkNa2bwCSP8dw9mlBYu9GnD+ZBvnarL0UyV
	rWgmJbi/OXf05O/B8S3zIqJkPsiufjpyniny2Gyz8FJvIzkVSHACDKBsikJktY8A
	ucIS0ABJZyAXtTnF9eOi04qE34jUUi4RmpYFrfS/eYGlBCNV8C5i3hNNe0jbv9Tg
	dYARwg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efxy7wunu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 01 Jun 2026 08:30:02 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36d99181eaaso1704264a91.3
        for <linux-clk@vger.kernel.org>; Mon, 01 Jun 2026 01:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780302602; x=1780907402; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+C7AjW3L/4e0skJ47LK5kmpxZ6SkXBdtEjzyI+WlN4E=;
        b=Y70QWgMh4Zg+jBFIrhXnINsh76yk60nTtnsehyxNDXiAb8T+GZZMvXxj7uRx7TATtT
         JKK3mkDqnreSprmKIJ+eA7rVW/uHltaizugzGLR3sb3Om+f0zVETF27ZXZCODC4sleUd
         LvxNaZnTkdtc8i/7UzSCf2ZL49JxPiNeuUtqaqvR3KiVZZgaL7CgI6pDhC2hdOhPCCf+
         g51p5YiixQtSnM6rQOxfmNWxYhvgrL8LRQw/JOp+/8Tgn750dW2NiXsFAiZWiORx54he
         WYRrqwYaUA7YfN+j9tZjPnuUkio6IUfH31av6IRkAEj310C2dhJJSTZVxSJMNtC2cO+3
         0EpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780302602; x=1780907402;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+C7AjW3L/4e0skJ47LK5kmpxZ6SkXBdtEjzyI+WlN4E=;
        b=C64wMKrfoYJuuTFc0w+z5KPal77kq+UDP8k29NxP6FWA8klgP1n51V8tkAEIHgZ5EM
         MGtK+vU8d9Cb8vVhy7cA+nDNXl1tQkik6uBC6pHJzzHcGkWzpsrONN9xm1suGpPA2d2W
         ivonkHL0uXqI3d8JVNjYgehHOyUxBgrO3dHeR9wblYJOE/RVHLaAC/BfeE8Y9dhYPFMY
         Z4CWuxBr1FgFYUQBekpuDUY4g2CnwaQsWQtw3TyJYE3shkx9YOoAI8HHofPcLkw9AeTC
         fjt196aemTGlPs2o+dxevGL0XRYugekx6o6YUty621ze4U/B8qAzFBaoRhYw0wSIV2eK
         lyoQ==
X-Forwarded-Encrypted: i=1; AFNElJ/gXImkvbEtDqF2VNYpCJehfNbOBwiCRC0933ctDM9/K4t+nLZXA7ZMqe49nyUDs1aHgFisQdfGeeo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBA29jx8o53NHeGwKo8RlB/tm6yy7QWJYOPsKjIpLdGCSIA3Ss
	893uzjg4p4UmF4+8KeVn4u/xxQZPF+7Q5nlDpnKiXuWBR1czAwZh6jsb93z9yRyW7sygkvHNM/D
	QUrSDBXGw5Z4zCYtWimLAb7yTkjGrUfRGgYvLehMFyZF1nURRI43MuFhg8HPEtmk=
X-Gm-Gg: Acq92OGUvxkdjXQ4VNLe8uI6r+IZs8q61wFr0jPc6p3jA0X3W5n2vainhe3OXNjeTlm
	WPJxEVZGIDkFoY7QdFPaPXp0HxMzBl8d7fiS0x3Dluoul5V9EFpx6zuUI4tVTG1pxFEjzsoEyhC
	ZKiTdTfXUwWc65FmLwuj3Xp3ldcbThkYF8jO/IZh1NsIJAVxaEg5kCEdqqI1FdTa9THE+2IMLyG
	I1JeqK6aMWUGEM4bwwPWrrac6Wno4jZgN/NHQJMDb2NbBjmdCDXoGZGCEWwxFbt1Bu0x3pJ5rov
	Z1dvm6Tuc+o1J3hcPh3qOvndS+FVLeyxO+vIPeDZKtyOMEIAmP1EN7QTJQaSBGzrmhz51P1wQuP
	SEWAsiqEuW5SoTGnHBImRfR6ustPDucsMgiO4ZkZXuroTXhQbvIiwSzpCk/4=
X-Received: by 2002:a17:90b:5101:b0:36b:7c4e:1b07 with SMTP id 98e67ed59e1d1-36c4feeb84emr11044995a91.5.1780302601932;
        Mon, 01 Jun 2026 01:30:01 -0700 (PDT)
X-Received: by 2002:a17:90b:5101:b0:36b:7c4e:1b07 with SMTP id 98e67ed59e1d1-36c4feeb84emr11044975a91.5.1780302601467;
        Mon, 01 Jun 2026 01:30:01 -0700 (PDT)
Received: from [10.217.216.23] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bbdd1a855sm4491346a91.6.2026.06.01.01.29.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 01:30:00 -0700 (PDT)
Message-ID: <4ab6aa28-6b0b-436f-95d3-23b54d73a992@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 13:59:52 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/9] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
To: Bryan O'Donoghue <bod@kernel.org>, Erikas Bitovtas <xerikasxx@gmail.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
 <e7WD-tbtAA7Bx0uDnXgPHto9hACWxgblhI2eitNHX4VYEgxOOceuY0sOS6KQnGiyTaDYaKudZt4k50z_vJVpnw==@protonmail.internalid>
 <20260519-msm8939-venus-rfc-v8-2-542ec7557ebc@gmail.com>
 <608dc53d-17a8-4230-9ebb-48a94bf03675@kernel.org>
 <6ae3a89c-f205-45c5-87c0-5550f78502d6@oss.qualcomm.com>
 <01f9a303-846a-4048-8115-c94b9b78078a@gmail.com>
 <ecaa113a-02d7-48b6-a94e-9299a684b0be@oss.qualcomm.com>
 <4JzpVyRt008YHZIv34VGG-Z_etL_fh9cE8AL30d-uekLUAxGmZNV9os6xkESzPAyzDHFHA9XXyPgWxzBlEfnhQ==@protonmail.internalid>
 <d8177e27-7cd6-43f2-b88b-2dbce936421b@gmail.com>
 <82f7a200-ab07-4ff4-b84e-305351f78460@kernel.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <82f7a200-ab07-4ff4-b84e-305351f78460@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=POg/P/qC c=1 sm=1 tr=0 ts=6a1d430a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=uEUO8UhmWA4g_SfyP1oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA4NCBTYWx0ZWRfXwG4urKTaDjj5
 KG2qf06FI0j0bXotnjk51y5KlM0bgJ5+nv0k7vHpmjQCFTNfM37O94AtoB1hMWbU4zYa/yZORnA
 Uh+5pH5b0+uC4JsZdNussfsXIvMIqSREjWHy9dX5nKauPF6fkWgeE+nMrLDQSeV19fiTjkwc2Lm
 6CvmBHz5gAxxVkw6qg31atCteH4xcHpVo3YVe8LTCD3UN5Xx+g/2CR4FyyQfnr12639bHbx36E2
 QQtX2KJlFvFdmjYTuhByrw5Z9MWM/Xypl3Bepnb1xv5z3X/tkedp8/JiAHSi6Yvz7W7hQr0IT7P
 mEMQ34PDw05RWuNM0Xr2AXoGQa/orEos/1gCkjSHNr6T7IA2TwoIWm5PEKuZv9zTD0IzEkIdFqD
 89BRLNZm4DdFuhjkOBK7wD1fP0/6o6It252ZwEdHQyzL103JtBaPceX4TBP/3xrZH17PalNCtyd
 /Rxa8PbQ0GJWBUPdyOw==
X-Proofpoint-ORIG-GUID: OvcXOcrXXjn3s_2RLbXWI2l-IFS8la5A
X-Proofpoint-GUID: OvcXOcrXXjn3s_2RLbXWI2l-IFS8la5A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010084



On 5/26/2026 4:20 AM, Bryan O'Donoghue wrote:
> On 25/05/2026 10:56, Erikas Bitovtas wrote:
>> +    for (; i < res->vcodec_pmdomains_num; i++) {
>> +        pd_dev = core->pmdomains->pd_devs[i];
>> +        ret = pm_runtime_resume_and_get(pd_dev);
>> +        if (ret)
>> +            goto err;
>> +
>> +        ret = dev_pm_genpd_set_hwmode(pd_dev, true);
>> +        if (ret && ret != -EOPNOTSUPP) {
>> +            pm_runtime_put_sync(pd_dev);
>> +            goto err;
>> +        }
>> +    }
> 
> In Iris we do
> 
> - enable_power_domains
> - enable_clocks
> - set hwmode
> 

This sequence will always ensure clock can be polled as the GDSC is
still in SW mode.


> Instead of
> 
> - enable_power_domains
> - set hwmode
> - enable clocks
> 

This sequence will require the clock to have SKIP or DELAY as the GDSC
is moved to HW mode and it is not guaranteed to match the SW expectation.


-- 
Thanks,
Taniya Das

