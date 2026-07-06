Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C3E35AC24
	for <linux-clk@vger.kernel.org>; Mon,  6 Jul 2026 13:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783343225; cv=none; b=tJAKYdTmQGryk4+MNLsmHVdsnXgygWcN2OtvbT73PMLvJ2c6kR42koonHt+hFDQvnAWeidBhK0vNP++KVtxU9qWvMI2rarGiEwTF75OJv+JmTa6qMGSs/dt7yWCnP+v2uJIkc+EEzp4Cd+xd6bjv5/JELd4pHt4GEwY4XlxENwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783343225; c=relaxed/simple;
	bh=2/8uf/+qERy4MZwmlx1x9scy7YvKot5nqNIMyIzt8ic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hL39xESpjLK/yTNe6Ub6AMgdNsktn5XoyFs0Cy8TI9ZwvFgWSE2Fx6d8Q72z2eIh0yCfDL5D1oDnAS9YZru0mDNXR8YtNVyHY4lE5gMhv06lwO28uCql/qm/HHwI38s/bIk35OfoVrPxUbfXlm/gi4PnZ+OqjtUEWat8zgn8Ua8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QbOWvfYY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GncpzDd6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QbOWvfYY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GncpzDd6"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxLNj367215
	for <linux-clk@vger.kernel.org>; Mon, 6 Jul 2026 13:07:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+aJEqe/aUkEC3wO10Vna7LP2Zs+q/5u3K1GL2ugMtcM=; b=QbOWvfYYxMOrrPp8
	bcZMRh5+gVIjxIia+4jGtN2gxG6/HBu+g2SD5G4FQiPmmCaZXxIuaxA17qiHd9FY
	JRMWrQCauBJjo0JgYhxypmj3yRmPWA3hDSD9tWsz7XIR77upkB0J+SsOrzvCRmhJ
	SlhobXzeowDnyvqIfgf3DuDSC53V6bKAf64nWQ23M4oSk6D2Sjdxakos63QbA+bL
	2J5WHHhpOPLcZl3/ruCBunw/xfgrnU+PPFzcdVn/iZHkW4+P/wKT8Vs1Me9IJjl6
	XFMYCfVPI2bjhGBGcfAnSVRSd5uhcnTaLDixCEPfrrm0/fYPG0BruYyAhcDWPjj2
	XVvYLQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f891us0jv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 13:07:03 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5bda0b2b6a4so97208e0c.1
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 06:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783343223; x=1783948023; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+aJEqe/aUkEC3wO10Vna7LP2Zs+q/5u3K1GL2ugMtcM=;
        b=GncpzDd6GSXhcVDv4llMP3Rxv5Jt29eh170+StYPbN4SasTkgKoJs2ebJSwJVGJfCf
         T+8v6HMzBQd7iUvKel3zYG7Vd+rWNhoKrlxvY2ezHK1zMQ3/TXdyM8bNtCm3Op0htkMX
         Edfw5GLu19qVrnz3y7fizAf/foAYNSOvp/S83XQcWnRW4D3OZPNyVzpFDoslc7VT0YNJ
         P7czAn+o+fsWu2TrWJkkDOOfWKwbYiQgYh1eQkWd61xMAcxn3Xjq4vVVFAzJTnMi0tbY
         COuiQS+fintULPR+CLwImlFoYbzLWv/JI8q9W7QeBcbqtshXYmn+TNa2s9BW2tvH6Zhg
         FyLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783343223; x=1783948023;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+aJEqe/aUkEC3wO10Vna7LP2Zs+q/5u3K1GL2ugMtcM=;
        b=Mlj3tTuPsY2ffOKnKabQOnuY52+6LPH3cX93WuFoBwqmzVw8uePzv96A/ZBr8skyEm
         0R+Ke2vm3+I8Exl/uIAch0zjQ7Xbr11LRJmzEpdgM9Hq+NBOwCSyXvLoGFXQSxkj9LGN
         WonA8d4NDJ76Yh6BgFSIgWoW7HoaJJPYZduaBAruPSYG0pQHiOQGLB2lF5JNXU/JfUIi
         dTenDrae4gpAu5KlMGcmCHdOa3u+ZO2xKgxCBDU0qg1xV0vcAfcIAc4aa/1c/WaTcuaR
         XaOB4x3vYojWUk/tczy+xlz1tmwljS+W3QREns6JATShpgmiqUL80ptcT69FNWzBH7JJ
         1xaA==
X-Forwarded-Encrypted: i=1; AHgh+RqXKubVl+6ijeIbP21YDH847XjWDP/XgYfhLmIZZxX3UUGPRrgOHO+bsiPLU2dmUQ/Z0V5Mvm6+k4k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiIoOEITWgBB1duOtm4yuW1F7+wpCgGUjLsaVw5XwlJCQIn5B1
	bzHiwTUoi8CpARHGfKfbBS0VEtSEF1TNa7KacUxrAf44B5VkTNsCrp04JubHyU+MceQvnFxsSjR
	dxANJ9NeNtdTEMYoAgPxrgHquxkE2c7aqo2kOuIRM4/xVjbEn9LfUmuFxv3N2lNo=
X-Gm-Gg: AfdE7cm8I2SE+wFkBXwg1WkV+WKcPVLVqQxmc7+0DljT/mULerc9OJ0+gIePKpfCFI7
	+ZWoVk1fbyYWJ+m2UY3SkQx6gzz0CyFX9gFtrCdWYfkeDo/vsb0vrL6xUYPmJW+jSlWw5VIs6T3
	HT13akeKyS8RWn1xWQ6+oTbHN3uDqKmSFumb6qpjRwAr5RJRExTtsfG04vPybHEX/rKNOekgwZ0
	q3wZYvF/iRl3p3+UgmMJRuzs0JTV8eRzBrAAVv5qTRUx82dDy/3QUI0cxzMbEsoidUHjATxl/wV
	WCMwSVijgidDXJpHx8eMGxBj8WfkV+HLOaTGpmwTsT5RSDWcJw8e7Ek5qCFFkF4SQKvYLqzVLEm
	iyLmEDQnk4Qw5H1kLH9XhA3r6kTYAywg/tPY=
X-Received: by 2002:a05:6102:1625:b0:740:178:770f with SMTP id ada2fe7eead31-742079e8eb2mr1233252137.7.1783343222822;
        Mon, 06 Jul 2026 06:07:02 -0700 (PDT)
X-Received: by 2002:a05:6102:1625:b0:740:178:770f with SMTP id ada2fe7eead31-742079e8eb2mr1233219137.7.1783343222369;
        Mon, 06 Jul 2026 06:07:02 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19db05ecsm3945114a12.28.2026.07.06.06.06.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 06:07:01 -0700 (PDT)
Message-ID: <a1542303-8a71-4387-8651-fc4f127fdfb1@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 15:06:58 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/7] arm64: dts: qcom: eliza: Add support for MM clock
 controllers
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260609-b4-eliza_mm_cc_v6-v6-0-17df09e5940c@oss.qualcomm.com>
 <20260609-b4-eliza_mm_cc_v6-v6-7-17df09e5940c@oss.qualcomm.com>
 <197684ce-e0c0-41ee-ae1b-c9b31a7f6411@oss.qualcomm.com>
 <7eaa8b9a-ba8b-4d07-92c4-3a965ad58708@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7eaa8b9a-ba8b-4d07-92c4-3a965ad58708@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: crYTLK1hrn7CGGIntx1tGMYMgXvGbWgN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzMyBTYWx0ZWRfXzU+EaEC4ABOH
 l2SvHtUJsRKglC5nkOr6OiuliSx9M6oT497Pc2A8Li0ISg/dTmEWKmzotfis7lJfTxzBDODW8KW
 nf8JSE2lflNDcYYg/EmcZF4DrXiWraM=
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a4ba877 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=uHYfjYNGAha-st8cwW0A:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzMyBTYWx0ZWRfX/7z+EEgJKzQq
 Mwwi8UEoihhuTAorr17FGTwSohyv+vINz0Q6ZQgpM6DJSYKJ0WuZO8nxyjywuTcWwNL9KnZey8u
 EgFEhcwhvrl/MrQcmZ0rdKeTMRI/t8A2nREHZjxvCUO2JkSDcWgHwuhNXnEuKsw7cb31cWA8d+H
 EPX+3Hy9DRDJyaoEkO0BMIOug3I2U4vxu7xKT1wXgoMw9o607IHOFixlRMOz2DZt0QuvGhPiwqQ
 w5OS04HwSGd3P8KEgJ58hQgnpoEkNeG0V/K8QA6EEvLZn/O0xJowfj/elNW8QDIMYB6ov2GU73e
 bLYyMcHtpJlWsmvUr+9q9UyLV5Q52HV5bb5MPmT/AOLJ3MDyCF1Y4L/Go7otBNz1Ufo7UxqSL5Y
 2K/aOA8QvwdB9nwQIxIV6KOO4YQImXuPSD3Jpo4Dfizy/u3yHgtUeVo//35GikphnWifH6BJ8xE
 HwHcUFjbqnvQOlp+qTg==
X-Proofpoint-ORIG-GUID: crYTLK1hrn7CGGIntx1tGMYMgXvGbWgN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060133

On 7/6/26 7:28 AM, Taniya Das wrote:
> 
> 
> On 6/30/2026 7:39 PM, Konrad Dybcio wrote:
>> On 6/9/26 5:02 PM, Taniya Das wrote:
>>> Add the device nodes for the multimedia clock controllers (cambistmclkcc,
>>> camcc, videocc, gpucc) for Qualcomm Eliza SoC.
>>>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>> ---
>>
>> Almost all of these nodes lack power-domains, meaning the
>> aggregated performance state requests will not be translated
>> into RPMH requests
>>
> 
> Konrad, all the clock controllers are on CX, similar to Milos and does
> not have any special voltage requirement for the clock controller.
> It is okay to not map the power domains here.

I don't like repeating this every two weeks, but each consumer core
may need a specific corner for operating at a given frequency and 
the way that is conveyed upstream is via a hierarchical structure of
pmdomains, where the root of the tree is provided by the rpmhpd
driver

If the connection here is lacking, every requirement specific in the
OPP table or in the IP node via required-opps goes to /dev/null and
RPMH may do something between aggregating to a lower state (because
there's some other node voting on it by pure coincidence) or shutting
the rail off (because there's no votes whatshoever)

Konrad
