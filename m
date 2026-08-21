Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C67476040
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 10:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787308480; cv=none; b=QI1rpIOxUJx4vWFXX5h/wDaRmZEp5AkptCVfGCHYcBARk1WYraI7hTvYAacZuLWkCaMELWLkNW862JwCLsqzSNKuleD+4AMV0QZ9TDG++8ZFr4kD3mHGRfbX03csZyPVKKxxagfrs+EfFRAGvSWRJipGN0Ho/wZRcoWAAMBDn5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787308480; c=relaxed/simple;
	bh=5zMdoPmIoLyyM0dKvIT55YTmQvzQmNq41lcYOrJS61k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NcH8zkIwAmZ9LrHAtaxr12NsA1XPmKeevV+QY0SUF5dv0KuKXLDCcjOX8fgSYZGFl88LomWk+rSJDKclzwbU/t8rm3C6Vx0IUyQZSvcGz8M9Q07M2AYtpOcCGBRKpsWT4TYyP/wMuJWUaRW6sB6Gmewe+AFGwQ0LUuFj7/rT6JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nIL73qzp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MBQpwF3p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nIL73qzp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MBQpwF3p"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L9M93m1550681
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 10:34:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UOjHPgH/1h78uGEI85ecUIBarzFNIpLpo5cgkB5sGqs=; b=nIL73qzpgMjL3Fbm
	Vvug8kPON1rFtGhYYtMsDLx2TIYe3eLV/GLvhFwh06koXcVOfzYiHqFXttycE0hC
	f/Dk6+w5d6y/HjGbXBzBJNWRwSnsBZQEViTH6cer9GQOmmPfWBJ0Q9bjdvxnN+dK
	zBhVOKHHGeQVZxYZl97q27YrQWAd4n4jjf0XrEVtIDu93CCcrkQDuvPnLzN29621
	AjEU+Nv4qbZ4j7xitpYt1RxWTOW04rvedqn8gh52NKOPJLsADiTf52xffWiPMica
	ezWFzW/mP3NkwH1CDEB8lVYCj4/8PkV/GvbEbBr0/aYkw3QDlReknlcZni03ZBRU
	SeMtww==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6d069s94-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 10:34:28 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84f0d3ab2f4so640139b3a.1
        for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 03:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787308468; x=1787913268; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UOjHPgH/1h78uGEI85ecUIBarzFNIpLpo5cgkB5sGqs=;
        b=MBQpwF3piHKG19aTmJB78wCCUdYQoLnkLuqv974ubnCPidkzGL2enshXkCHU3gy9PG
         Wlom50MGAb/aFt+K/K1/vq1292embPePzlibkWqbJXsPf/NvvXJVZU6irhQ2xkos6TXJ
         w0nIZSot4vS+IXdjPxU8qLSGOi8j27CPSswl3ZH0aKYeR7hO1kVh5WqQrgULori4k2bq
         cX+kzLNv6EuA41Na39HTFM7MbKSmXPXc8ZKE/NI0BnL4oNw6Mc72AIpsk3m4sW6CJJgU
         F7w3TuSaXcFbvp8BEbIxc91csHTILtt+gORhHbEUKeXB9+1H6y4uMQcisYqN8l1euhTs
         Thmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787308468; x=1787913268;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UOjHPgH/1h78uGEI85ecUIBarzFNIpLpo5cgkB5sGqs=;
        b=h5zIrwX1A2/wV8oh22RhQIMpH2R03udjSzzrMdZTWsXNmaM3SQ70lQxJQrbN/8A58J
         SJ6VIckmFAUSwhk5lmfPTGSyhqzKwrDpxSDmUGo5uTUKCGtTXudxdzxhEMg7IkkVs9Rh
         kiBgVE1J5fZtBf7oXxKy20STX5o6XpVB90CuCwXQv/CFPz93IBcECHB2yRXqIS25uhoA
         ZmUBGQyyl5NS67MaifTEnLr09slwuxlZWJt5kbI4KPO8bjKCcPO+OIJHzGVc9t5zHWdj
         RZ8zTfdvUBVmr+DfAHEhUeakJtA8c1/zMXjdPC0Cyj7rR6MM96ffWQo5ossFPLoZDkgy
         POKw==
X-Forwarded-Encrypted: i=1; AHgh+RphniK+YBpE44lj9PHIvK51hWOQdOvNn2Inj58AHzH5Xfr10S2O4v4yd9bIyW2hTZmWjuoCRaaOBNE=@vger.kernel.org
X-Gm-Message-State: AFuF++mCsCprQ0MsyXijQL6ipVm+0ewYmEkFPRIHMUOzXDZckDLP8bou
	HjpTvI8kAQWNHbF4tbqtoqsF8+dZsV184txhesg/SBuKNY1Vx7dg19oGPWdKaXRibayrhoUG4pz
	7qk+Dz1ICB+6z5VyL/+y88ygGetW/SFOS1JyfmDtLVhSEptp2oeHzJ/4HcV5F3Lw=
X-Gm-Gg: AR+sD12ovkSnl/ajTNYoHKVWClTnlGXt7OAfpSoe/pFq/swbcsF65aE9thSw3QVrAr9
	Qc6Bo4ofL5pM8AFbB/i33eok4Hw3PnFluK0skWdT+yTtbt5OWPEF32q3ixR0gm7wOHeX9orPUiA
	2bKtBwkj6tSkBgd/muhmqnwFwC/77eP/I1bPAR9nGLogwlO7JSOf4f3/5XkYYCs8AwDBG3GDzW7
	ZR8VMHX+yhvoDvgbnvC0ZEvIG5d2zbYAUDGmuWHZpr9M3pQ61oKYCvqAL2A/ISA3Z98/SKB/RZn
	jYDlfU90uTYa4/nOs3dTQfmxZOQvqhXlZFtCB8tH1nKEEC+saGmvfkULTWw2jLbVDFxkG/rKEl+
	piAtM2XAURAd+xmxTC8jmCmzb7lTmCdNFwuHL
X-Received: by 2002:a05:6a00:2305:b0:851:8bde:7873 with SMTP id d2e1a72fcca58-851f9f42680mr7475545b3a.8.1787308467378;
        Fri, 21 Aug 2026 03:34:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:2305:b0:851:8bde:7873 with SMTP id d2e1a72fcca58-851f9f42680mr7475452b3a.8.1787308466823;
        Fri, 21 Aug 2026 03:34:26 -0700 (PDT)
Received: from [192.168.31.188] ([152.56.14.147])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d3362860sm2688575b3a.8.2026.08.21.03.34.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 03:34:26 -0700 (PDT)
Message-ID: <812d71fe-40e2-47c8-ac4c-ddb8a45f582d@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 16:04:14 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] clk: qcom: gcc-glymur: Tie the CX power domain to
 controller
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
References: <20260715-glymur-fix-gcc-cx-scaling-v3-0-72eb5adad156@oss.qualcomm.com>
 <9a3b9b76-abb0-47a5-ada6-cd0a576b0782@oss.qualcomm.com>
 <3df2f139-bc7a-403f-bece-7e820b202bd1@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <3df2f139-bc7a-403f-bece-7e820b202bd1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA3OCBTYWx0ZWRfX+OxPH9mfWaZJ
 vDRo4dMxkZOeMrOn+qy+kkO3U2MR2i1bzduOzWpuAVyNgar8y43BKt6w6KsZavdcwfC6wOB01qv
 i3k6WSw5u2j5et9PoBEwrqxrGg+WsKB0OOQiFJL7bZhHHwVrOj/heJTsruoHKPgFpz5JeqTWbIv
 KuVbBHH/i0CwkmOZ1turHi04fBPMe5SLXY0VqiiJWatux82g3Ou+JnZHbXFzIDYNMkt1bU7+V9S
 RbtLG81B3bZ3ADvho75HXJ4kZo1WgnIst2To0DSgLrG+ZP/gyMTjGrQ7UNmFJNZ5JDuPIvplxW5
 QwxBsBjtPsUYNHqctUAkM9YnmRZcwz1b1kqp3CXD0ODlfsKDym2y9Z7UdziptWG1f/UU4PuDCSg
 ZICTD1MEqF/w4MYl0feVKfIh1dt3hr9sOY0SrJ4NcexOdfLNZC8DmA+sJFV139dXBhumNv/mcwy
 HL188bu+5yf/LuzfJAw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA3OCBTYWx0ZWRfX/O/DP/qEk7LW
 05cpdaQqv7u0Bc+QZiA4RyH1hYyubjyQbc1f7r5ettC8K5DqhFywFSgOn3U30x1zjGc2EJ06dA+
 +M2kNiUNfhL/Y0+QA+SCGWOYP2EIWpc=
X-Authority-Analysis: v=2.4 cv=DdQnbPtW c=1 sm=1 tr=0 ts=6a8829b4 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=UgjVaFD1vmiot8dKuSzQiw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=F55jpGqvRUC9acNfLbcA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: PRlECzFoNLMs_2GhvB_1qoyGMEcMnQ4r
X-Proofpoint-GUID: PRlECzFoNLMs_2GhvB_1qoyGMEcMnQ4r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_03,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210078

On 8/17/2026 3:40 PM, Konrad Dybcio wrote:
> On 8/14/26 8:30 AM, Pankaj Patil wrote:
>> On 7/15/2026 6:59 PM, Abel Vesa wrote:
>>> The suggestion of having the CX power domain tied up to the GCC
>>> controller started here:
>>>
>>> https://lore.kernel.org/lkml/fe210f0b-692b-4c45-afc4-fc2bc5e57854@oss.qualcomm.com/
>>>
>>> and then, for Glymur, it has been brought up here as well:
>>>
>>> https://lore.kernel.org/all/0248dc51-1036-426c-b1de-dbc71696e2c1@oss.qualcomm.com/
>>>
>>> These plus a discussion off-list led to this patchset being done.
>>>
>>
>> This series prevents cx collapse during suspend on recent linux-next tag: next-20260806
>> Reproducible on latest tag next-20260813 as well
> 
> Yes and the ""fix"" is to disable the GPU nodes because the custom
> runtime pm dance done in the gxclkctl driver keeps a vote online
> 
> That should be fixed instead
> 
> FWIW ath12k is causing some issues for me in this regard too..
> 
> Konrad

There's no need to disable gpu nodes for cx collapse on s2idle, I can reach cx 
collapse after disabling crypto, camcc and evacc nodes along with reverting
this series, Specifically arm64: dts: qcom: glymur: Add CX power domain to GCC
Can you share the steps to reproduce? Are you running additional steps before
triggering suspend?

