Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458463BED31
	for <linux-clk@vger.kernel.org>; Fri, 29 May 2026 09:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780046621; cv=none; b=lPduHPV6kPBmCr40uDfIZpToDNIb5wK/jxSypY6VXFNaOA77hXiUEooNJCVz8iFlVqF4TgcW0J81VKvlsvu26nGaV3yYDTe49IgExpIdu+f0VYFHUa/aJrRocGaiRFIti35YaCMv4O/Efv7Da32mS0WIvfve9bvWV6hN4auEXqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780046621; c=relaxed/simple;
	bh=yKQGwCGb+Y08ygukP6FDC0FdKGY9Z8KzEzx5YkkIu/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m71QvsAOBRaGrVWzU2uQIy50RBDiT3r31v2NDYCcxmttpMEiHf3vHES3BtITIWCdeMWcywmt3lZ28fyysWTK6pcZEVI/L7yR4XhLgRGhsl7futlP8Y/bXtmAs7qgUfg0RiELzuml/rd+1gMBO3h9oYWt92u4Zb/6BzHuz12ya1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qw2te0VX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EnSzuIuK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qw2te0VX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EnSzuIuK"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T6Hk7Z1370525
	for <linux-clk@vger.kernel.org>; Fri, 29 May 2026 09:23:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TiepCEetZN+eWue0toAa/fv9fpAuxKXAQs9YKOGi2FI=; b=Qw2te0VXR6O4S1F3
	yYn7Kc3mAPuTJ4gwjM552fM5yR7nwNj235JVGhLHpGzLctX5cUmbSoTTrLHI8I5d
	Ye8q4FsZrciQKNnobtUcxiJwjlcaqDIVcKMt34PBNWGfJTXfF7ybKvpvXbJLj/E4
	SttIlA5C7Sq8Kl/TxN9qEfV5ui46nQ/OAvH8RcLjUNkiXknDEmYvkUCddB6X0hef
	og4AkUrVgILTYRO78yLg2/w1YhSQERZRvI8/tjGMuwzx43rOzO3E1sZG1o5sX8Po
	B3hdTU3oWv1Fu5y6H5XS9q5E4TtS0TZlw3qs+RWu05rnx8evUguDrxe1fr81JCBF
	5s6EXg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eety5uep1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 29 May 2026 09:23:37 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82fa7c6699fso19501502b3a.1
        for <linux-clk@vger.kernel.org>; Fri, 29 May 2026 02:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780046616; x=1780651416; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TiepCEetZN+eWue0toAa/fv9fpAuxKXAQs9YKOGi2FI=;
        b=EnSzuIuKCz+nuHWnMi4XQ6pvou3dQsR4iwIYuUUeyBS9N+BGkBde9YYHLkVRrSY9jc
         Uy+9jgql+TiPU0ZeRlqjTmO8SahaLJFSXiKja1CslPZutA3X5euAtNeKxRuyJc3xK0SU
         87hWr1DGZB3RT5CY92+biGUOuMnENLwEIpXhONHadsF956uPKBUg9AvSGvg5180JtNM9
         UpAcg0rlKzaXSzV7/rImGjk/gkEBmY7mWlX2mZGfHojT9ryu3DD8vYlsaxNr2ooJlXSG
         ANnFwr9n/NK+oUr5WrbrPlaB/6bWL1nGgjm/4y4mxAKFtbzDxz188BoErctINIlRvQ67
         eWjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780046616; x=1780651416;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TiepCEetZN+eWue0toAa/fv9fpAuxKXAQs9YKOGi2FI=;
        b=MLgS4/eRWTEYdpooKW9NVO0Q1YUZFzK5WEIKZ7leL9iNtAwJMBRgAvRyiRp8h27PDD
         ABoxKJpTLANYYl8gz3dCj4/0IaBAJ6yyt/dbRXgNe5px/mm73CexH+rKQssAF+X1iXZ4
         tMra/3QeyLs7NiepVaQ3sFu9HHh77tyKHWqE7E9DZALY8Ux665dIFALq7PKAKVSqH45X
         FuDHGFXZkDI/FEqjz0EIMKWjpgNij4/PqrQS3GRtt4VVoieHouaBirDQ+siBU5+p6L8V
         lL7Bogh53/YDp54TpVuC8vxwDo1PRS3PPxtQzQFrFsZ1F84B0Tqv15iAUgFfl7HsJGVH
         t6rg==
X-Forwarded-Encrypted: i=1; AFNElJ/wjreYN8/toTGvnp6uIka/V1baIXuVyV584hn+QVWDZzAgQhS4LT9AOOwcnJe4rtO3L64PbzG/dFY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCzcRpY77xHItGLtCTgmoc//NwsNsy6WdtKzqoIQviSgaacG4N
	J3OpIdrzOyfH3ZDkkGBwX9Hx0ZAqY/1B1WHVfkcs7B38NM6EsByX1z6/IP0aJNFlD+k/B7a9Wo5
	KZBHbqy5iPPatW+oBgUZwbcdJTYQ33z/h4UzkZIG3RcY0/fNhbAQow2xP0DI74oY=
X-Gm-Gg: Acq92OGYjXF4Z5JVUZB4nW5EqGFd2HL/bucerCzbY7fcfRNLStagtA3Iigg851f0rtI
	QtQrjyLQGOw94e7T5OAlqpSlNYreuQINn4j/YZ+hwetmsAFhfXcaAVPut4lhFoHBehjG1VzH8+x
	MV1dQYCoZ02oIFMUI7NpNnrL7eWEpO/KCWxmgx8E2ohe3mjbGD0Z2apuHy300HOfQM1aWfRMvzE
	Poh5sIttxVSJHcLiYgyYEN52/r3LgHc1/ceiRB1uIfAPGBq/Z3yW3pgaJX0BHjtu/wBQz+gnAxN
	+JwY3szHjFCau/mEDh6R0oKPsRPeOLgzalEV9fZSLWqEz10uphXg3ZyX1ToBj11pZ3S67WNxlrp
	VU7aBLub9gyJa7EpvLTwX4ZBfwNuMgBtVAgFZV958Wy4tPc9LH865UbbgiM/Odw==
X-Received: by 2002:a05:6a00:4f8e:b0:81f:31c3:2e34 with SMTP id d2e1a72fcca58-84212b83c1cmr2358721b3a.25.1780046616123;
        Fri, 29 May 2026 02:23:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:4f8e:b0:81f:31c3:2e34 with SMTP id d2e1a72fcca58-84212b83c1cmr2358688b3a.25.1780046615661;
        Fri, 29 May 2026 02:23:35 -0700 (PDT)
Received: from [192.168.1.2] ([117.192.250.176])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214affe29sm1240298b3a.3.2026.05.29.02.23.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 02:23:34 -0700 (PDT)
Message-ID: <6d5fa33f-449e-4f22-b0d1-60a3a21a9907@oss.qualcomm.com>
Date: Fri, 29 May 2026 14:53:29 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] dt-bindings: clock: qcom: Add Qualcomm Shikra
 Display clock controller
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260528-shikra-dispcc-gpucc-v2-0-953f246a0fbb@oss.qualcomm.com>
 <20260528-shikra-dispcc-gpucc-v2-2-953f246a0fbb@oss.qualcomm.com>
 <5nghgd3lt6vyewd3a7l4kahlxiidxdhgtu42tuyb7xeq62ztvu@tvclo336xtpi>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <5nghgd3lt6vyewd3a7l4kahlxiidxdhgtu42tuyb7xeq62ztvu@tvclo336xtpi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zZ-TR0iEUMY48M-IeTMtj6GuDAq_qClB
X-Authority-Analysis: v=2.4 cv=TeqmcxQh c=1 sm=1 tr=0 ts=6a195b19 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=MYhr4v4WboA43l5+MyccHQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=Wv3FfvtsC9jmBwEqIE8A:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: zZ-TR0iEUMY48M-IeTMtj6GuDAq_qClB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDA5MiBTYWx0ZWRfX0ftY4Zqgq/6w
 shluPL/Wx0zm3PSrUnzLfr3U4WCutmdr0Upf5H18tH+36B8LlrsEiTsle9pW90AC/LYfBUum0LT
 6fqBmkFVMrz+TC2s/cAHhfQyxA7Rzp2dTmQNeyh/Y7O1JHH65d0mK5FOkgIqY4CipM7aPyypK0x
 QO0FjABJ6gaLmqVZo7aGAWTCwL47MQJ75cZf5tM2b2EXsSdg5+xIji+SNNH231jw3c9eN7QZrZu
 AYefB/BOEW3jFi2MvM0EF3jnlVydgoc9US1qW7fc9cpYEZmTLQLl1MXqwtYbkieMHTtswesGpnU
 bUGHS7PQsuTM+Mq6duIhpg3DLNBd4m9BE/zelmkmJhZBVx6t6ut/2vnSoZAmI7qJFC9RZ2PlLaj
 +u6t/Y3zyDdbb0MygaD2m5GLVAcsm6E4ivEcnxUPV0VH/yBAZqntkfCPKvcFrYvvH7+xLgCo9HS
 lErAzfyg2OY65tqVfNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605290092



On 28-05-2026 07:14 pm, Dmitry Baryshkov wrote:
> On Thu, May 28, 2026 at 03:37:03PM +0530, Imran Shaik wrote:
>> The Qualcomm Shikra Display clock controller reuses the QCM2290 DISPCC,
>> but has minor differences with the number of input clocks. Update the
>> existing QCM2290 DISPCC bindings using conditional schema so that the
>> QCM2290 requirements remain unchanged while accommodating the additional
>> clocks required for Shikra.
> 
> According to the IPcat, display clock controller also has (unused)
> inputs for the DSI1. Please extend the ABI for Agatti, then extend add
> Shikra.
> 

Sure, will add the DSI1 to Agatti as well. Since we are extending the 
ABI for Agatti, I will remove the clock-names from the bindings and 
update the DISPCC driver to use the indices-based approach instead.

With these updates, the bindings, driver, and Agatti DT must be picked 
together to avoid any functional issues or ABI breakage. I will 
explicitly document these details in the commit message in the next series.

Thanks,
Imran
