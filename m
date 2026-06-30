Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2534D4279F8
	for <linux-clk@vger.kernel.org>; Tue, 30 Jun 2026 14:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782829316; cv=none; b=DcV+AwYBdhvimGR8lLFHTHJhexhFfzVdOHbL8GhZkp+locT5fuX4zAdD+L3rFfyVeLmQu3iVmM2/AX0VdUi+4V6JIHFqqfrXcX5Fi+Mzf6CEkryVzKgZZ3TX3vGCyGBej3n6pNOfEwb7fuWFLdxEfVaYbzezcyacNPVRblkNqZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782829316; c=relaxed/simple;
	bh=G9kqYB6eagm+OyD8Pc+SpslaGYJhcjmiOHRPtgz0Lik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nt9DQdD73zfNMI37zaGmbmOvU1ObU0EKeCZCA3ddODbsC6GuRD468HkpY86TAD9rX3DtPNi1gfE4IvS3N2etSvdYNbFNvuI89AN4yW4ac9k1DrKvWlWd0DnaXd1rDc25AXFtPOrQiXaD4X7HPM9yuDQA9eHDG2GPQhHfoaRiIZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TFfJDc3x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MDsFmSSy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TFfJDc3x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MDsFmSSy"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UEDanV2210544
	for <linux-clk@vger.kernel.org>; Tue, 30 Jun 2026 14:21:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G9kqYB6eagm+OyD8Pc+SpslaGYJhcjmiOHRPtgz0Lik=; b=TFfJDc3x/eb/PjOm
	P8nlY7r+w8wwe+ZLir1711Palwy9kPDOqFtKEVVynKQkrCHVbpO8aII6+8MxzoSa
	EIbLv5hXKNoD9/nSwnEraSZa6y7f79hVbECnnwVVGeXETLcSHkFCTi0garWn5vNI
	KkHrCcgx35Lii1vwcxkgN/EfnGhdbnktTVCnM3gJJj2BZ3qJ6t1quNdsZ4X2j4IJ
	sum702IejtGB3UVYNwDRH3uJHPRdLlHTl1CkZJdy9VRAZO/nCtbmsDWMv/3vVsO1
	ua/F+FDLzcQJASQ/cxVp/z522mqhtmmn164x7HavYcVJ7DB79OOhJ0oEB5oplDLJ
	5slfoQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4avpsbgq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 30 Jun 2026 14:21:51 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-734f7d8bb37so443324137.3
        for <linux-clk@vger.kernel.org>; Tue, 30 Jun 2026 07:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782829311; x=1783434111; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G9kqYB6eagm+OyD8Pc+SpslaGYJhcjmiOHRPtgz0Lik=;
        b=MDsFmSSyi3KX8S4iahlA2GjNJ8d/hGFk17OvUyaSiX6RE4Oa6Wj4igY3tSgyjQRVJT
         DU37L50ynGeCgR7tn3IBaNy6+kCi1UPspHylOWrGuO8sqsFR0sDtCWGqgccMWrC1gFvs
         IOOfXZidl/dPyiI7eUsiN+9pgIN+fRrgRnNbDbMgo1x+cDHjJtI9T0af0xt/XIhedSQ9
         qVcXUxdXuvel0SGhHi01xXFXpTFebQeS6q86QekgoxA8cpcIU4j8t23Pr6JYVIR3/nI9
         nP8HtmnIoRsRtLz8VxCsTdmO0BFzPfWqPUFsZIkjOoptH+QgiIvCaR18TMp2IWhQUFxZ
         V4hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782829311; x=1783434111;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G9kqYB6eagm+OyD8Pc+SpslaGYJhcjmiOHRPtgz0Lik=;
        b=LdGAKRwW2cLDgKe4H7RQ0OmpSpkiVcukRr9FajZLad6b7MY42IZztc7gpa5akFZCD0
         qYkFLBPL7fwoE2bZQ/fh0x2botwsWqAYlIQkQawFsfb/l1i/NtNfiVRtInLG3KSnJmOw
         62NAWSJuPggATo5oUbyXGj7P8bvS4jk8ydpqgEex+vxJtgf2vQDWOdQcIdKzjcYakfqQ
         6+BFd4cEh1nAKft5V6rQz9vhnUvtYNBK7OlQ9sm9eLy9EWjVHUS3+2yi2eVMMfEB0H7y
         0X7S871EGB7MsdmNLBF1Mh5XcU7ogmBBV4o2taIs9Tp6HKpGb/04xbAT1ZNATfgNvZwn
         B5dA==
X-Forwarded-Encrypted: i=1; AHgh+RrCGxNzhMSEkJyWJWhZzEOvQVDuL/q3/OlwuIc0Z3ROg2sPtbbC1qtzwmPAqUYLwoU2u6GvI0bjPyI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6E+9/TctF6H5sAKckccTL7MNlqcJFXv9rnBz64F6H+U16QD8R
	NA1bNlygKS+7gmoVKWYfJ0KnfF1HbWrCzRc53la0i9z5h2/e+MAROtf6cg3GIXKO2mU7FP1wzgg
	nrQVWBAkbagJ5WairBzB+QXUS0Pnco77GHiiKTXxp+PpJpTjmywxnn/Es4geZrmI=
X-Gm-Gg: AfdE7cmG2H4eh0Khe/OGsFYb6zbOPwajiEXwxigL4uJ7hMFI5KgBgXzO/5kLQtykE6s
	nWKArUthjZXohEU+SLsiFIl3v5AdAlBBbG+c5YNHz39JUO91y5ZKiDhtMQu51XSWxqk8WgokENj
	i/T3K8mxrG2NCZvX+6ueJsOrd5IJ/FVffGOQJ9HAsk4OhcgXE1Q4ky7EHrGMEBx4meVFGyyNHak
	9qgGOP6neF9QN0MHj6gZNyjkr3A/wS5qxOFn0qpvJV/lUFqK2pMtlxZ4Jnp5w+8RI0qu/rOPfwd
	ebcohF1Zo4Cth2UO142g7eZ2pWjNrn8OxKMl3D8pImUJp6TWXGQLO9TwPuBDZv2ewud9dBvS2hy
	Y4tLZpjMoOE1UtOocKZ7VcPDYEyBC4gun7VY=
X-Received: by 2002:a05:6102:4488:b0:739:97bf:9180 with SMTP id ada2fe7eead31-73a39752cbbmr575223137.8.1782829311143;
        Tue, 30 Jun 2026 07:21:51 -0700 (PDT)
X-Received: by 2002:a05:6102:4488:b0:739:97bf:9180 with SMTP id ada2fe7eead31-73a39752cbbmr575205137.8.1782829310769;
        Tue, 30 Jun 2026 07:21:50 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6987c21f123sm1380324a12.0.2026.06.30.07.21.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 07:21:49 -0700 (PDT)
Message-ID: <917f606b-55f9-416a-8dc0-e66efac712bb@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 16:21:46 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/13] clk: qcom: dispcc-sm8750: Add support to control
 MDP clocks using CESTA
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
References: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
 <20260420-cesta-sm870-dispcc-v1-10-eb27d845df9c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260420-cesta-sm870-dispcc-v1-10-eb27d845df9c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zKznN0LAndg7UVcwxwVKALnnoSBUwsDB
X-Authority-Analysis: v=2.4 cv=KqJ9H2WN c=1 sm=1 tr=0 ts=6a43d0ff cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=5f43vwGa_zqDpS5p3yUA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEzMyBTYWx0ZWRfX3eWXFZKXutC9
 m9ZfA5FnUU+ksdLPXZYZI94R/YqpFOmj99+smGW/A6A+tjIxX0v/I4uTiPysL7AkBkz4sXaQTza
 ODplKpFWmG8A2f7i4N0EfgPe0NMOdOr8Xrp/EvZMjGEHZcttL5FzxFlm8Gam3a9dI62MLQkLOYq
 b7kY8apZMhwRXPKhyRVI51Kb/zxYrH603pIxXUVggFFXSvw55wRKZjs6s4t/bELDuol+UeXGZMt
 svnFqwK4G16iRR6njss005d7X0y8QHbAf9CB1FQaO9Ul/5zn5jjyBVTqy56V3iiCy1nAIHz7FWG
 HRNXeiq9m1las90LzI+HzEnitI6A2MNbT/Fxw1+UDlNgqTe94hY7lmydbbY3SaHx4q7htH4q6Ug
 LxFZ80S9C+6wgdjMsOY4pimY5WRJp4DpLM2GY5qHhlndy5rsigLvzyQbKvFAC7Wjs6VuEsMndik
 UZtCbfR2pcfKxVORzvg==
X-Proofpoint-ORIG-GUID: zKznN0LAndg7UVcwxwVKALnnoSBUwsDB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEzMyBTYWx0ZWRfX1jSy8V9oqz4H
 D4e6gavDBCXhPdvaKycQTR7RegGjJCjBv/jXWRy9PsgLxh8BC3d0VMTP3odV5eUZH0BxXs9Sibg
 3H9cZ5oF5UUdO/8wjob9MrI3ajdLG4A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300133

On 4/20/26 6:29 PM, Jagadeesh Kona wrote:
> Add support to control the DISPCC MDSS MDP RCG and the associated display
> PLL0 using display CESTA hardware on SM8750 platform. If display CRM is
> enabled, the clock ops of these clocks will be updated by the common code
> before registration to use CRM specific clock ops, allowing these clocks
> to be controlled using display CRM (CESTA Resource Manager) hardware.

Does CESTA only control a very thin slice of the total set of clocks
(in this case MDP clock and PLL0), requiring Linux to still vote on
the other couple dozen manually?

Konrad

