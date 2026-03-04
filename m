Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F7537186E
	for <linux-clk@vger.kernel.org>; Wed,  4 Mar 2026 11:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772623209; cv=none; b=hby4rBYQ8GvXfbnHiTk0PV3xVs+EJmtna0ACu3b2iC/VsCv8S4TWvT5EXjwXe6igaVBySuPpyjhl2Nj3EyzJxo6WvgR6Cq6+tlkN239ucIjoKl3t4pCDH13b+t/gYn06ZluSTTqck1qCiNP3NpTnHzM7Pk4TERP143QLQsgn1oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772623209; c=relaxed/simple;
	bh=mKaH8Qy7gLqqs8O0dRzJpiEXsb6oqzMNQeYF/Te1EUI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U+oK4LdMq2VpdEt/yqJkSeJo2txVAfJ2pd4AcwPz5epjQ6iXFaRwov3f6xkO55oMiq8C6xGnmceQkJvsz/niXxGOdsZBvlocxO9bSnplhu+dsZxeML4q7IfFv2O46CcahvRa8lzzZJpCKWkpS6fb/2U+iggTBQMbZc03FtByqsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mU4rpbS9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aEzyUQaP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mU4rpbS9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aEzyUQaP"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245T6hg1678611
	for <linux-clk@vger.kernel.org>; Wed, 4 Mar 2026 11:20:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mKaH8Qy7gLqqs8O0dRzJpiEXsb6oqzMNQeYF/Te1EUI=; b=mU4rpbS9fbhtYnmd
	2+LsjKBlWhmaS+ZXZyzbuKPjCMGvb1W3yeLlvlNRsJlXEAiRpSqqZorzfZOjEVs7
	vodTLAdxIeUegobW3vYk8BOCoNFAsrSHtf+fg5rTWl5eCtwe9+V6RTMmpDypBQ02
	uY8d3bedMe6ZwnUobmtQQCv9UXW/mYTz0aVNtfntNyqumIiXs9hlX4A/nuZmJD+3
	TDadDsU5KUD20ngTWBPlYSJCnUiWH95K+n6sg4K2vVfj8oOEKNRSMkSl+UjzMBvf
	D6HdNWuWYztDTyzeawf83Ea6T/MTTDWVTmKreyRX0+H39h/2CY7v1+I986XjtbX4
	/oIv9Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp73hakws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 04 Mar 2026 11:20:07 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-899f6011df3so17246706d6.0
        for <linux-clk@vger.kernel.org>; Wed, 04 Mar 2026 03:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772623206; x=1773228006; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mKaH8Qy7gLqqs8O0dRzJpiEXsb6oqzMNQeYF/Te1EUI=;
        b=aEzyUQaPGame5/gAUDqlSq+Dp0WwsKOUnDsAWULpBX7COMMha2iScv+IZ5rroOwWEn
         yZ9QyxTFI8Q2/5UOc600g6ca73Mrqgr6dzeNLHmJ9ySsbCmUUTMdNqfD3LMjo/grkk1d
         tZo+FRbN7vFVCcECymsyGuMPYXYvqTbqHn3SK7WbwT89vnbjxPCYLAn30a0tyenqA+SH
         +yo+fW8bysDOfLCGha/3K97SEVFWVfJzT2Sa0DChEMlArDzi/M1LLY954oPRYyOxlVxK
         XRIxbH7NYI0Q/PLUhOCXpJVsyB/NKN6Q4JiQnDYvsyvjFdHsW3ToDGIqdyzZ4Z34yPmI
         tNWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772623206; x=1773228006;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mKaH8Qy7gLqqs8O0dRzJpiEXsb6oqzMNQeYF/Te1EUI=;
        b=O9efmWprdHocluXyMHBj4asXBDGPWhsH9PezGPt2cr0HgTOpR5kKKACHHqGYsw+esX
         iQn2P+1fhUkPCLvYJSE9u4Ob88kwyrCArzmzgTPuEErobQ6qcNUFW7hNam8NloQZJuP5
         xqOz2ScCQt3b28w8l4YB9yPbgQfo/a7bsLeNXxHstRGXLR8KdolCgtXh+M+0+i3cJ0XF
         3u2NcZulso9xOV5MdgvYI60QKQ4DkEho7mZK78/oAbz3y9okapsdWJa+8vCdFbgPpsls
         +JG5dK+DDAbP8W0X0I4/zJZmyQww7OfZGw6468/ZlCHVQ9LeTAI4+DDTLRVDpaovzG3P
         tv/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWQo82WsT4LBLDp+3mnLjvMZaLW60GuxYAo40D2vQd/smNWP20mLavEckHScO9eWjJM9ymsIL8Xfig=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcWggMgzuIajADDdn4LUZKBAGGgkudfPq++59ed1cbDxZrzqO4
	8XFXrtHphHthJ+uN1Nm8YF3mlhoAwSNou+im0boE0o3bIXo6b6sSlTSNoPlcKYgKqywI/URVTfR
	SiVehgP9zc1bpeLE1vDIb7tcOP8CBVeeYonjTSensRnIAfqS4Ue5+PQo1G1P9SWE=
X-Gm-Gg: ATEYQzx1xaShp/jt9kdRXhA0krPieGSEkqfVvqUO9nMiuqOMD8l1JpeqH8pslqRqVtg
	5aTATYHneeZmOO+BH9SsKaOFinZcZ6VXB0zbMN6tIgU3vCk2l1/dQcMPPGHtEVf4Dbbgd/9i+Ar
	YVgM7xStGGU/VdplpElUM8dPjkPIu9UkJK7YvXS55J2rgVYTypiYgcMBCrMQpsplPGDQgn94FGt
	91SjKW9v4cgOpqa/dqG6HLFMli4dUL+jHHAxOtXyEAdkv2dsZ9p0X60+RYQwpsKYgyBzb1aztD5
	1J6nC59SjWCULfnV1cKZvZcV/UpcwoxLNDx8S/5PFIFZ+Nae3Pu2yJ+5iu8ITGk3KgUyLRrfTPW
	vTdCy6DA429lC509+ab9QNiycHDJT8aea7KMhtLg7ATi4IQhrJiaSYbL8RgxnMge7qpZhKuho0z
	jyugc=
X-Received: by 2002:a05:6214:6015:b0:89a:14c2:b7de with SMTP id 6a1803df08f44-89a195cf8c3mr13291926d6.0.1772623206521;
        Wed, 04 Mar 2026 03:20:06 -0800 (PST)
X-Received: by 2002:a05:6214:6015:b0:89a:14c2:b7de with SMTP id 6a1803df08f44-89a195cf8c3mr13291566d6.0.1772623205976;
        Wed, 04 Mar 2026 03:20:05 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ae8fee1sm729947666b.45.2026.03.04.03.20.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 03:20:05 -0800 (PST)
Message-ID: <d90cd589-8a0d-4e72-82ae-7e78dec2320e@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 12:20:04 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: dispcc-sc8280xp: Don't park mdp_clk_src at
 registration time
To: Pengyu Luo <mitltlatltl@gmail.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260303150152.90685-1-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260303150152.90685-1-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Mq2TIN-MYYfTJTD4JtB7DmGtF7I0ycEn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA4OSBTYWx0ZWRfXy8WtiMLTxoWN
 U/ZVa4n8UslOc13zaLbPC+84pyEdM2qYb2bp0wCBQ6+s6lMU8y0rDKG6crB87YwgqRQQybIy/HA
 8QwGo/MFfn/CHbr/J8cfVJTlbShiEyPWsW0kKKeZB7KUhCIZSIydHReh5fplyPQRQHRvrzodjvY
 ACm4VedW8eoSsKQaWIde4+4Gp2CSV2za/G9WOGS0nnH/Py21p7CrRRBRhA7cnb7It1VqeHI1UGj
 NbU7pnL4wSCs4kwFRMxTxvxKaKh/xBByvZY55aMHSyWyuaSqXonReVF84/n6kL1Q6+i8vDPgHy+
 jyS5zs6abPyvp2VMRb3GREd5oJl+iy+wTMqHPbGHRhgFLo5q8a3e/Ab8rmzLyyosqPmuLZpGrZm
 gZSAxexfTnHHoUTvb2dVuS/9Vuh3Ioly+Np09WI84d4pIlr7SvEwzi5zJ+7gaQGZ0NqrBDtwwzy
 apBsCaO4R/fLWJZHRpQ==
X-Proofpoint-ORIG-GUID: Mq2TIN-MYYfTJTD4JtB7DmGtF7I0ycEn
X-Authority-Analysis: v=2.4 cv=BpWQAIX5 c=1 sm=1 tr=0 ts=69a81567 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=dqsZej8vO5kNzgafIXIA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040089

On 3/3/26 4:01 PM, Pengyu Luo wrote:
> Parking disp{0,1}_cc_mdss_mdp_clk_src clk broke simplefb on HUAWEI
> Gaokun3, the image will stuck at grey for seconds until msm takes
> over framebuffer. Use clk_rcg2_shared_no_init_park_ops to skip it.

Do you have clk_ignore_unused/pd_ignore_unused in your cmdline?

The sc8280xp-huawei-gaokun3.dts references no clocks in the simplefb
node, so if you're unlucky with timing, this is ""expected behavior""

Konrad
