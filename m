Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30582342CB6
	for <linux-clk@vger.kernel.org>; Tue, 24 Mar 2026 11:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774353537; cv=none; b=UPMHz5uqCD9OZNc+a7fmc5SiIBNvaTyta3uw+Lp3dtVwZOW/LsnabpTQiLqpr5QbWNrNRrWi/z1F+f0W2S2cKGsXmYeIPggrQmJF08yntOVHksa4VqGK0MIKnwtdvxOvp3rirNFc0moQFkHYLDF83Kp+w80TqirxnVkPTRpaplA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774353537; c=relaxed/simple;
	bh=ckylz1D42VqgI96f9II8osrhte54J6UEuCkjDNdXrCs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f7xkf/sZNinh55iY9RwaMwCiWfyvwtlB4DE5KC1CUh+tCpfxL1WdyNcCFxPlakNNbYVMKiUETue/h3lhIshBoTqoZmHr7PMgIKakd2Kjlafb8x5BtjqxhPsr9G9HnAL7kbi/5OmJ+DzhfQMgONDl29hGqDzGTGngBxHepneOZBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D7oo8wSy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aCnNyENw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D7oo8wSy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aCnNyENw"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OAJu4N1762009
	for <linux-clk@vger.kernel.org>; Tue, 24 Mar 2026 11:58:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	clH1e0Cy4hwsmGxeM8ke0FPWxpPVuAh4VlJlFp4Vk6s=; b=D7oo8wSywlR44Ms/
	GZyq45fCaI+vFJW2ffoPvc4unCl8JnZkN0r2SGhJ9xS9xV6m752GDGZRVp4tUZRK
	dPOl219jhA72Qjg0m3ok+zv3tHpt1GNqyniO1dvaCnqTIg5s56X2cCig+z/SKBTk
	ddO7mK4/jkxysrqNTIikvuBlrvmTlf0kqmNoXZ3ISONZAL7Z4NXM4WEEl8BdvTs7
	R+VRhwETdkLwmDONyLvcffbDhjJrjiiIl3fCeYbfumg9KHEsbxHLUj9XzlA1o90M
	xCCqFajZ2uuuTV3mJd1EAJXvG+PkgmGKmjyq+/QAO7WB6Bp8yDtjLXtC3irhp7iq
	wa+Vqg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d36f0can3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 24 Mar 2026 11:58:55 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82a8203055bso3195862b3a.1
        for <linux-clk@vger.kernel.org>; Tue, 24 Mar 2026 04:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774353534; x=1774958334; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=clH1e0Cy4hwsmGxeM8ke0FPWxpPVuAh4VlJlFp4Vk6s=;
        b=aCnNyENwsxieVfnv8L+DTngw84A3cmoP7lFvc1Ljm7OxeFci6oOXllgZUj1ji5H7xf
         CVK9uWtTTN02Erl6G8tB1tPJzXkO+dse/wChNfAE60pHjDqvxNNYuq1D9OVRXamsaZ0l
         Ib+7zuLGt+BGeKaEm2iJzEZdyy0Ao4VbEdXdVvyRHtzPUalN6dhMLL7UABgUgiD3Kobq
         FVo6goJdydaZ3tDdLya2d/EzQGQ+GXLARDi+Fse6xPohT2zFCwF6578Jh0JixmlmpXRb
         /OBqiOqyeo07zHyKjYiNvUZkx0C4+Hzrlx/9NM/dZM0SVNti5PF4CEqkiacu198WJiGm
         alpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774353534; x=1774958334;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=clH1e0Cy4hwsmGxeM8ke0FPWxpPVuAh4VlJlFp4Vk6s=;
        b=ENr2GjiOKnmSnkuPKp8s71RZrWAU7ZkYG8oxBvV9+07s6wMiGwjoJZ9EYzdkVrqruH
         jcoJBCR5ZAwSMoseA71U8AIjFfBO616GnIGrnCsC2/Fo5fXuZiqiJv7S4LTaMyHOT8ky
         DOZqWU6lAplGlDjRDgKTfrcqSOXMU95FP4PboWV9Y6TCaU4prmIANZTrDJadpM8AeV3+
         uKnmKWRS1Bvnq1faPv2GbdfuFVIx5iBBfddEglfhoVZRFIZzclVvO5SsGhNphzXu2gm/
         AzwihprCs12QdFwIWKMc+0MhIWqlWF46keFrxxtdpMWh/cdVH18gFTKTd0FVS3K/bNcC
         q5bw==
X-Forwarded-Encrypted: i=1; AJvYcCVuvPUNmbH7c5v3mUZJdU3hgC2ArPWcDqNT0FQA+f7Mw4d0XV7Y0S3V8i4LKhJd6CPknAv03OhrQlY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYxCqo1omWHs2/axhCxQPG68gS5//rpeyK11Vu/FY3ATqhGVC/
	5pEU0HjIo0daPvxkdKuIdxKoRg7ZArSvsiNVDc1kSHa9kJwxRvurJUt+V6xx3giIUmVqtetmMdw
	R7fw6dIat1jDL4jXHIGamSh8HDqDHQ2YqFKDWXXzZxRP43OF5xCFtjkAn8e9a7G8=
X-Gm-Gg: ATEYQzwkyEPCTq63L5m7Ost+bP0xXVmdHCJzbC5YplCjbnB0vCqcsP8quOHZvnATXEa
	tVXKw7zDYhDjfbZpBzl72rOByqDmu9fHpMvA8cG4U1ZVyfUlXGH0YUKbEAaCjclYIipMsEy6OK0
	FEr5D4tsmOLLjnTNzbEW8Acr9rJ63qiNGwRwcbuekAb5PzzcTv1tuPo652j9+zAvQ82v/YV9hEP
	NZ2RjOOIxoe/tC2FbiKar2/KnU3UPu/XUEltq/hFh3PMfQUvfqtTh/bmyg+qW1LT3Xvp8N2JYEU
	2SB/sXYPWuw13YX1Xw+4D60uahi+mnSTX01atkU8CBzNnxm7jsSW9fojT7A7eDGfwaU2EZvBaM2
	ihY5ykDVMlltqe9wGlya0o9N7hXQRn+mubZx3BnTqWkMU/1aK
X-Received: by 2002:a05:6a00:908e:b0:81f:3afe:281e with SMTP id d2e1a72fcca58-82a8c247e08mr12677157b3a.3.1774353534205;
        Tue, 24 Mar 2026 04:58:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:908e:b0:81f:3afe:281e with SMTP id d2e1a72fcca58-82a8c247e08mr12677135b3a.3.1774353533721;
        Tue, 24 Mar 2026 04:58:53 -0700 (PDT)
Received: from [10.218.7.247] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c38564de2sm7765843b3a.42.2026.03.24.04.58.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 04:58:53 -0700 (PDT)
Message-ID: <a0b6030f-be42-4f5d-a59c-db78912ff0de@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 17:28:48 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-eliza: Enable FORCE_MEM_CORE_ON for UFS
 AXI PHY clock
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260323-eliza-gcc-set-ufs-axi-phyforce-mem-core-on-v1-1-b6b7a6f3f8c5@oss.qualcomm.com>
 <26twtzbvqcevl7jq6idkhhhasf4kuu6a6p6qby2plcg4a3vola@exafx7os7jls>
 <753c4438-6450-467f-916e-b8a3f1d3940d@oss.qualcomm.com>
Content-Language: en-US
From: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
In-Reply-To: <753c4438-6450-467f-916e-b8a3f1d3940d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=b+q/I9Gx c=1 sm=1 tr=0 ts=69c27c7f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=XRPxiVp0QSZokBxyJdoA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: sm6Yl5xQlDSpT4lPs35R7TQ-c1CUrotM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA5NSBTYWx0ZWRfX0eymjLjbPVeK
 PmFqAK1xiSe/4J3XlA3aiT3QrD9H0uVDsx9H4uTbevmSU4ng5gyL20Pi/fgMIQveP+CdcySBZHZ
 Gdte3aV1fK84STQItBSqtYdhOhAMTxoIcvGCYq2yPLfVkJmDZtmiluJ6xGWTZkG9bFppB30amFT
 5f6Y3xlK2vgM1jHKKwuUJ8GVmACx0y4ZgzHRDb1TXVCuHqDFUkNGovIMPXD5DbwHPSr1s4hW7Tl
 QYX39aOtzrCkHf922QzEYYSTxEyZ4JvxP4TmUnLvjNNukC59vj4iZ7OOHzSi0MAoaaHhRzaVtur
 dM554YXdTdmqCF2D5Bh1Q5tLqGwx6Qi7PAxbvTUUBNcIMi9mP1+VfEchhGIZuU6+yoa/mTjZt5z
 HOQP3V8Qqx15cZ3Ij5I9ritnwMQdf4WMUNY2RtUPmxESUQe8JnN/KqW7JEpSrOrm8zrxnZmkWaW
 fxPW0F6xxVXR6BTPxPA==
X-Proofpoint-GUID: sm6Yl5xQlDSpT4lPs35R7TQ-c1CUrotM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1011
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603240095



On 3/24/2026 2:44 PM, Konrad Dybcio wrote:
> On 3/23/26 8:25 PM, Dmitry Baryshkov wrote:
>> On Mon, Mar 23, 2026 at 08:57:12PM +0200, Abel Vesa wrote:
>>> According to internal documentation, the UFS AXI PHY clock requires
>>> FORCE_MEM_CORE_ON to be enabled for UFS MCQ mode to work. Without this,
>>> the UFS controller fails when operating in MCQ mode, which is already
>>> enabled in the device tree.
>>>
>>> The UFS PHY ICE core clock already has this bit set, so apply the same
>>> configuration to the UFS PHY AXI clock.
>>>
>>> Fixes: 3d356ab4a1ec ("clk: qcom: Add support for Global clock controller on Eliza")
>>> Reported-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
>>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>> ---
>>>   drivers/clk/qcom/gcc-eliza.c | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>
>> Do we need to apply the same fix to any other platform?
> 
> Most of them, actually
Only SM8850 is missing.
SM8650 and SM8750 has the change.

Regards,
NItin


> 
> Konrad

