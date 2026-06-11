Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6453E3DE455
	for <linux-clk@vger.kernel.org>; Thu, 11 Jun 2026 11:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781176541; cv=none; b=LFh3cb4iXDMXwIzxUJHoERhO1S4kg9cO8NoHhFpXFeQjzqwd7jzOiH0k15CIMQhbkgJ6RFG2MGdj9SxbsW9QB6WU/pMrwHevfDBvMJxMJzUA126wup5nHtv1g6vtq9UfrO7imwzGfQNYPMMegefi7gHvaif6wea0FA0M8NDLV/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781176541; c=relaxed/simple;
	bh=laIREpsEBUXAPtTWdF7hMAJjEruMpnAQd2quvID9OoM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gZ6zvI/ViePJc2Xbx2zc0QcNtPacqKbHWz7tSynsP/uo76qtAeUEsluHMSe5CnzD6ZZvnHF+zekZoICHeTG3szge3D2P1T8e4ChoKqbPTrq4aF/LkBTZI4Q9L/7fzmlH6VpOSInHTZbQ+HKBgWNqycceWtNRDvM+s8OUj/L9hkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jnFP6fbn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YO47Pe+Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jnFP6fbn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YO47Pe+Z"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xqxY214491
	for <linux-clk@vger.kernel.org>; Thu, 11 Jun 2026 11:15:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5OCxphMzkt3Qxu9Ul81ai1QpDJoc03uf0INUKFrkEXs=; b=jnFP6fbnq/DOZqoj
	hUHohOcZ4dh/W1azTTALWMCBmmtIm15E6O0qiF3BkbIuIfCXnZ1v8tvW9qRvNx91
	QxNNbJXUVNXWO8BaK+c9chhUNgHoN9nD47B9eTr61hR4KztwO+spLVo6j0w5AqiZ
	lNwZnGHYhs7RTHfoL8IDzSm7pFUhEABw8ISIwOfJ7tw/k3wFLIdmD6C72vEOICVj
	aVikPQW07lZx9uT9CwA8U9QKUNPQSwat54GUtupfY65fbCVUqNfg28owqS9y6M80
	HS2eVrffVyH23w1wnxjdq2qD1l7nWRCXXyd8UVSts6Uvl3JNLLDWCg1qHBgB5GhO
	IK30eQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6sk60w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 11 Jun 2026 11:15:38 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5176891d0a9so19993821cf.0
        for <linux-clk@vger.kernel.org>; Thu, 11 Jun 2026 04:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781176537; x=1781781337; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5OCxphMzkt3Qxu9Ul81ai1QpDJoc03uf0INUKFrkEXs=;
        b=YO47Pe+ZbvLi3ezLsRDWTFT9pjnxArmJFtxveaiY2PgcmU4TSfVEeqgtr2fgni5H/C
         ynDuEmhHwAzvr0O7vUvWLhK66Z5HpHR3R885R6mNGuxb736s+pKo1GznmJwBNtsrONh9
         hwgXOcUKxFPbOwPJQXoHp9wYaHdBmnPI3c4R8+UWVnHDCmmQs313fcrS3fDUJ67232BJ
         8SDeAB+J0ozFYwRmndgiRExAKVB02QTbWM4EOVCgBipN6pbaIz2Xn/lN6UsRbApCtrrQ
         V27IrmDnInIfFbzniJcjJavpUOgaLr5fKMOiOZLptYEV4W8+sIP+/Hr2+Au/8wFcVNhp
         BlvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781176537; x=1781781337;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5OCxphMzkt3Qxu9Ul81ai1QpDJoc03uf0INUKFrkEXs=;
        b=W9K6l7PC5PjEYJGGE2TH56XS94dr9H3uO5Ge701H7dNjrAumI+6T5sQvSLcuJrx4Va
         9PwWBiveGoh4Mj2R9YmhxdsqrYXoyVEpoPqIW9TaHqzb5IP5ShdnqlThH6SjydUFtbSX
         /37rg1XctphgKiH3KE9Taye+t+sf+oGrIS6VVJ7pvL2zSWlQcUiJ4PQGqBC+bbb9sQd/
         SaEIOPom+HCF8ntyHIM16VvMwZFUphU5vi2t2lQ6qawGWyGzIEK0ExlIlppn6vZ4pbVv
         1qv6uCyczU9cZx5HcNk4Ug+OIz0hFsKIgGK/lp7YfgBIjrfVMLVBEG+AHisqrgK4SFEG
         kJpw==
X-Forwarded-Encrypted: i=1; AFNElJ9PL5wCijT/RLeD/bquxESKdHVFDRbWNWxcFx4D/65M/Arg7iwEdX5+TIl6BcHLA9ij5fQlK41CUTY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrcBd1JAjeIyAgZ70tirW0PvYTaeMutQ2S/y/zkRr6xEefpL5C
	9AnYrVgWJ4nhpvq9CcR2c+DD4hzq1Th4M9fORlhCPw0v/6usBzvQWnqDofIuv7gwHkF0WgBgd7M
	lFVRvCcGNGs3RjGR4wP0AdjQMgvR1bR2e8JbD4dR2AyhvFji2QD7awPkrKvsdsX0=
X-Gm-Gg: Acq92OEKOlsTs85nbZ/tmAtW6c5K9M5aFz1OVMimfwyrOLotn9Xuzlvea/2rmdC2FY8
	OU+lyjOjCpGxia5u+hmoekNMRkuC8N6g8wKEj3j0ZxxCwbYTtK9nPQ10GZwPKE564P6e+qtZO1G
	2xGXiwKfuKcBzMAB7Wk8ORFQ/t+UN5tqvLFj9GjZcLIv4Z8Te3q/vS8FNXfUnBRmQKPNnSj8AYI
	GobsTkPcgLA1dxxZRVABO8niRby+Wbpc9yILbFfCNoNt9+6a1ms9lK4bxqIQAPlXNs0YI2PSBGk
	o4PCoO70SCFX7wid3b9zxuf/0kJyCEK0xI90Wb+ORh6glmHXqqsQ2xgaDdZqUYqmLwQS3qnVhOo
	JBpzEubFVsgbDzzBN6SX9PUP3V2tdnyxFvvUw/HX7CZym3NRj3MTl3J4I
X-Received: by 2002:a05:622a:c2:b0:517:5e32:f3ac with SMTP id d75a77b69052e-517ed683227mr22907171cf.0.1781176537524;
        Thu, 11 Jun 2026 04:15:37 -0700 (PDT)
X-Received: by 2002:a05:622a:c2:b0:517:5e32:f3ac with SMTP id d75a77b69052e-517ed683227mr22906851cf.0.1781176536808;
        Thu, 11 Jun 2026 04:15:36 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6912faea64dsm6985810a12.19.2026.06.11.04.15.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 04:15:35 -0700 (PDT)
Message-ID: <72dc1255-a1cb-476a-bff9-a49d960e0277@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 13:15:33 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] clk: qcom: Add Global clock controller support on
 Qualcomm Shikra SoC
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260608-shikra-gcc-rpmcc-clks-v5-0-94cefe092ee3@oss.qualcomm.com>
 <20260608-shikra-gcc-rpmcc-clks-v5-4-94cefe092ee3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-gcc-rpmcc-clks-v5-4-94cefe092ee3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GbMnWwXL c=1 sm=1 tr=0 ts=6a2a98da cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=IyfWUWnWmjsiacPjz4MA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 92PtBdbk8RLWExvVdfr6fWdT_DmfpJKN
X-Proofpoint-GUID: 92PtBdbk8RLWExvVdfr6fWdT_DmfpJKN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExMyBTYWx0ZWRfXwB9fUDDQUWg/
 By6YZH5E2veXGPYqE1BGJJWyZXrINqS/TYLyWJ2cV1WT4YUO3QS+REnF5Iu1yCLTtNjaiRnK9f9
 zrwQQu8UyVlLFA2CQmIznj1CIwtZQ9LFOuriD0ncZyKHNetW9DDIr1s6D/t54ysefcH/Qj/jGwn
 x7trkiHEU7TKCPDqlV+QDrn1hpQ043aife3AfQFcjtapnQWqF3+jWNgEHPn+FN5aDMsiUm8aewh
 HLLRxDvdzGe1SHo55kFwyrVXqt1YZlSYHrGwnKug51AInh0X4TySz5P4cw9bTaUAnvceuo8tDxc
 21FWL4olZFSSIwDST2Yk+bgLeBueWTEJNUME6GR1q2IkDbfRqAE4/FuAPADdR3sBWPBqtQLuD3p
 gPL3aZcoREsq3ca+6LJyb3yD72DGbEXSjzpSrE950hWwk+41L9zm79ynws5Uk3fk3KT2SlIHz3p
 mnVFBC9CVswwNi+Sziw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExMyBTYWx0ZWRfX2wYtEDEDvkdK
 +l2ysBRMfZk++A/HyK45/jhNTd3LAu4azvMAm1a8I8QAO9XFr2RuyhDuZ7RxtxYT7iLBhLmovj0
 lkcndCxzM2GyiYFTiallpemkq6HPrIU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110113

On 6/8/26 2:21 PM, Imran Shaik wrote:
> Add support for Global clock controller (GCC) on Qualcomm Shikra SoC.
> 
> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
