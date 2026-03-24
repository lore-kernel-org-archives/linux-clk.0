Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C9F3DCD8A
	for <linux-clk@vger.kernel.org>; Tue, 24 Mar 2026 09:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774344122; cv=none; b=s7IrGR9OJY6BoS8CmunQrDb7jB2PbsFoVPSNk1UnJSuXqTQgddMlqDbCJT4DVQ9dhZSCuCuDHtiQbaR2nnVVyVRqw0EqCG+0FSOYp4fuSPVXv0ahA9TfreLDAAEiRahtOA2+k/+FR/dOdwlKfdvmSOuNC+JcBLMuJtWcLYhYSIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774344122; c=relaxed/simple;
	bh=oeoMDPM3LRLWRy6Z2/BOgHT9lyC9OEUVfZIzQfGcsI8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AFigLewEI8THuJymAbRBBbb8EnX2ynxgcwnD2I4VRxGQVZE4JnLhCLD67T8bgW1/qQ24kZ58xg/l4AmCB8MZBCzK52abEDxdPovdjermjsWKQ4962b3jNEoZm34W5lSF/xMqoP6mkSBYkjveE5iF1ohHizplbs4bM3wIIYavorE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nfjebp2q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BPOxJqgm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nfjebp2q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BPOxJqgm"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O3cLaZ3634281
	for <linux-clk@vger.kernel.org>; Tue, 24 Mar 2026 09:21:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0a7+CbjtL5YYniXPo0gS7n8+aIO05dBx9x9MTQ0vfco=; b=Nfjebp2qNUVdMnZG
	mcNIghZ+UDsXTVev+XXRovZETuGFhrL18xNcSUjet5xoyjRSu49FJVO8ALqsp5DZ
	gHh6kw71+9ngvZ7IMVrUJZ1fX+F5QjfmpPQ9GmhFNqvbHguFwumr7HqXa+6OBCnI
	8A+MitxC3uxH0dBvqA3j+Bp8sK//2avfKJuy4YRCsoeZgn0ivaIzpq6VPTHTaGJR
	eanP3qU8E1LUXhjCBykGFxScEFSZ6E1uPYm18IiM4MY2GR8A8PjOVbT4JezbDWx/
	AP6l9bRETcpGS2q4NXoTi1pC2l4dBVYuO9McBej2a0DRlA1Sy1ICw3MesfZoFAE2
	vQT2Ww==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d34k4maun-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 24 Mar 2026 09:21:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b27636835so49538511cf.3
        for <linux-clk@vger.kernel.org>; Tue, 24 Mar 2026 02:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774344106; x=1774948906; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0a7+CbjtL5YYniXPo0gS7n8+aIO05dBx9x9MTQ0vfco=;
        b=BPOxJqgmPrqxV4DucZ5f8WwTTauews+W5gAdM8XCLzrSqPhit2hv90s9nJnBR20I+z
         cfhbnKIM4RXqjlKPVWIk9lPjvGzEIYgH7WQmeXRUOxEgepJOpbmHOBzgLExw0nSmKKZY
         NUgvpGtC6SWGC5Zk5a3tJiTMF0lT4UV6Gvb/2jxCsJrGITsqQfFf9rmTmmTAEo7CA6+m
         W3+bvOPsEllR1LWs3N4KJT6/OPBZ5C2X0tiwacbJUIgW0BWc/zxy+FIom7pMJC8ZT2DF
         on4Ch79yo9S9od/U2NUq+Z59JdP2US3Eknr5O4DVjdsSQvioRAr7wJBNc7gy/lObhnf+
         2CgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774344106; x=1774948906;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0a7+CbjtL5YYniXPo0gS7n8+aIO05dBx9x9MTQ0vfco=;
        b=QV0SedwCn56mUBQP+Yn6hdRlmIum+OZoJ3cEBDwmX/qGrqCrR4Qg7yz5MpDZI51b3g
         AmhgpugZlRV4W4vliVrfnMBjGoKZy5P7qeSEt5WUvY/t5cCUVNxZnXFqohu+0VRiizAo
         uV2zFXs26jy5+abIcUL9kfjtaIBEQiUUvOB47lA7QCnCmS4owhQqRVSU7x+Ho3T7cgAL
         +z7qpC3SahrcZJZgzTD+etmJV4G/euAdIkSbTOgxa6L/8iWlxFp+YQHDSrnBtfNgveni
         LtDIYpEadT/VsL4ja+ZzmLXqWdDAdxlsCORNUPgp1xuBD9kkg9mjxuf7SOVOPYfiZ1GS
         gZqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYapLUbycjQ//9oWWG6UcpoDkGEi+3yQteSvuE8caSjUCst9AXiRAPK90SHwHFL6wIC6kPxqmZJ/U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRDSQq/0qgJmv2dryLiIt7QwGKIa8lz7BsYKHCLOEbIRqml7eX
	ug+oHfDEIAQvaIa3OqtmOCm474Iif6kedFlC2+waozCn3Aj8AW7oFySVAN6BYHm3loNpJkLWtvg
	g3uHKTtaFXCFTETcAzTKYhckAtsQY9nsNM0p4S3/2KnhJtCYecwy2N6aUaZ7kyNc=
X-Gm-Gg: ATEYQzy2VmHnoZPvE5zlPN+7nDBWaxarCNpbAFjeVHPVN8FX9LCdpeKnwoUAbOAhZ8q
	8bDL1pS+wT5UUU8yt5B05Nssqrfzcjs7ojxm+VDMbW4mL8nY97HRJrxaE3K6qklTeVDsVShueXw
	g/shDVVlLydT3hbLKMWQfAKZaikARIXdp0IqUNkJmsyq6RKubAlu2yJQg4dvQZMq2FgK5sWToax
	FAJ5BwbTIuIxx9rQfQeTPzPvOWctyQtlrMLDeVnsn4baAtgOJ5mRcgXPhTzuFlcCK3iP3U3uTeI
	1LNAFqofCnobUYxd5FjOfyYUn54snJ9el7w2bnGvG3uL/9H//HsmVD2uk46p/pEWCKISr84toPD
	1EGKvXKHCPr1A/WDom5R8S9oQ55zacUWxIibi2o6gfK8bTY+bSlqam4FXw64mIrjswnGtgwyHHR
	3H2g4=
X-Received: by 2002:a05:622a:46:b0:509:2a92:8088 with SMTP id d75a77b69052e-50b373d0bfbmr192230811cf.1.1774344105816;
        Tue, 24 Mar 2026 02:21:45 -0700 (PDT)
X-Received: by 2002:a05:622a:46:b0:509:2a92:8088 with SMTP id d75a77b69052e-50b373d0bfbmr192230581cf.1.1774344105349;
        Tue, 24 Mar 2026 02:21:45 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f8c16csm614132566b.16.2026.03.24.02.21.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 02:21:44 -0700 (PDT)
Message-ID: <15d0ea68-8ee0-4937-87a0-7ccd8969036e@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 10:21:42 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-eliza: Enable FORCE_MEM_CORE_ON for UFS
 AXI PHY clock
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>
References: <20260323-eliza-gcc-set-ufs-axi-phyforce-mem-core-on-v1-1-b6b7a6f3f8c5@oss.qualcomm.com>
 <26twtzbvqcevl7jq6idkhhhasf4kuu6a6p6qby2plcg4a3vola@exafx7os7jls>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <26twtzbvqcevl7jq6idkhhhasf4kuu6a6p6qby2plcg4a3vola@exafx7os7jls>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: EWsRKumHp9x_lxsU-IPvxQ6H4YCvlJxv
X-Proofpoint-ORIG-GUID: EWsRKumHp9x_lxsU-IPvxQ6H4YCvlJxv
X-Authority-Analysis: v=2.4 cv=c+imgB9l c=1 sm=1 tr=0 ts=69c257aa cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=553ZhuPF3g2HGwrCK6AA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA3NCBTYWx0ZWRfXx82C/MfhiAqz
 fPcwryaOqKqoTwVB7iWnZZWl2Ume3GbatXaGmtyjgP28soCaP3HPE0dJKT4E3iZSzAsnkFjxCeR
 7C1zvOzAKcF6HPc9R7QHfh2Wg5FSb0c8pYASPQTl8hFHNNNwe2akm1qU/knFMxhMJ4PrSkCawsh
 0EwS4eoTSA3NhsuvYvm5HWfw+oURObQU/HtPZY+eXhiZc2IB+kttd8p/RqT4IjpS2HzFEeIdqkB
 gO1p6B28boAbDNnsozsDe7J7y9wFXG/zEo5BsdXF9oOEU/7FfFOoxA0RntdE2oxkgr2y068MRub
 s/yJ9lnxrnqIS+OwfhUqJCWUjWMvn3vUvZorGaV/1SonAmcqHuq+sM2KpWzU1+D8dRHB+KHMaX7
 Na6obpAxav/f33u4+r4FhLxfIUfnLYLb0GSFxOb2JOEn4SLi14TrAAaA1YosheiL83dEp6QLmRT
 di34WEdPUk5t07M88yA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240074

On 3/23/26 8:25 PM, Dmitry Baryshkov wrote:
> On Mon, Mar 23, 2026 at 08:57:12PM +0200, Abel Vesa wrote:
>> According to internal documentation, the UFS AXI PHY clock requires
>> FORCE_MEM_CORE_ON to be enabled for UFS MCQ mode to work. Without this,
>> the UFS controller fails when operating in MCQ mode, which is already
>> enabled in the device tree.
>>
>> The UFS PHY ICE core clock already has this bit set, so apply the same
>> configuration to the UFS PHY AXI clock.
>>
>> Fixes: 3d356ab4a1ec ("clk: qcom: Add support for Global clock controller on Eliza")
>> Reported-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> ---
>>  drivers/clk/qcom/gcc-eliza.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> Do we need to apply the same fix to any other platform?

FWIW on msm-5.10 (8450 kernel, from before-MCQ times) there's this
excerpt in ufs-qcom.c:


static void ufs_qcom_force_mem_config(struct ufs_hba *hba)
{
        struct ufs_clk_info *clki;

        /*
         * Configure the behavior of ufs clocks core and peripheral
         * memory state when they are turned off.
         * This configuration is required to allow retaining
         * ICE crypto configuration (including keys) when
         * core_clk_ice is turned off, and powering down
         * non-ICE RAMs of host controller.
         *
         * This is applicable only to gcc clocks.
         */
        list_for_each_entry(clki, &hba->clk_list_head, list) {

                /* skip it for non-gcc (rpmh) clocks */
                if (!strcmp(clki->name, "ref_clk"))
                        continue;

                if (!strcmp(clki->name, "core_clk_ice") ||
                        !strcmp(clki->name, "core_clk_ice_hw_ctl"))
                        qcom_clk_set_flags(clki->clk, CLKFLAG_RETAIN_MEM);
                else
                        qcom_clk_set_flags(clki->clk, CLKFLAG_NORETAIN_MEM);
                qcom_clk_set_flags(clki->clk, CLKFLAG_NORETAIN_PERIPH);
                qcom_clk_set_flags(clki->clk, CLKFLAG_PERIPH_OFF_CLEAR);
        }
}


i.e.:

* force_mem_core(true) for ICE, force_mem_core(false) otherwise
* set_force_periph_on(false) for all
* set_force_periph_off(false) for all


Notably, the Adreno driver messes with some of these settings too, as does
the DWC3 one. Older kernels (msm-4.19) also do so in MDSS, GDSC, CVP, 
camera MMC, PCIe drivers

Konrad
