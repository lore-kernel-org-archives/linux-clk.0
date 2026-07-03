Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9985E356754
	for <linux-clk@vger.kernel.org>; Fri,  3 Jul 2026 07:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783063711; cv=none; b=OHw0wSjFdfcM9quVnYXMHcSFFLaJF0PiIdrjCkeHGRzFIYLSDdbjuJuX7GnCfBYhAv6DplyhziZEi2/K8RtIpvr2YjhV+fu0TL9VHIbLkK1u4pKlIJ+QaQ1xHPwYj4OdH+WcAhUmEr2s0keuh563IqfFZ6F+HnBX0Ue+8bhpkBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783063711; c=relaxed/simple;
	bh=G91wVvJUuLS94VJDX6lLVmIRI4FU9naa3LbezLYsZqQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DrSYa/rbWsOK5d86auW7uRBkGYrRS9A4vVN6uiEYGm2dVsQpHMBs+6mGqNiSSwO6mMpfPklvJnUiRR0h0lSZGwtOayVfzxnd1ZK9mKfIuD86PY34DFgGbhOZ+TiLmI7rA/8dxTjZfEpArn4nJGrFrqNEZwmqDdfuWc9n8KRWw3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AjhSE2rT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=apgWzzN7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AjhSE2rT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="apgWzzN7"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6637IqjV3195670
	for <linux-clk@vger.kernel.org>; Fri, 3 Jul 2026 07:28:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j3s/Lpz8eS/XYwHEj+6SabC/L38ujp0lZJpz7O7TgEs=; b=AjhSE2rToalKwei1
	K+dBtfqm8aRKHIA3gniRHtGmn9r7Xp19lXMN5YBjqsfLGJjX+IdHIpRS0qPBbRvq
	xr3wyTxeDIjk6bZFvIxbuhAxqeLOQjUQ2kYVagONhUeLDeC0GZuTEyY1ufd2DuE9
	1/MVEaxoYSGr8OIypbrC5iuO4ypxnoT9cxlRl0P3pfxQe9pLlD4yBtTLEyViccGo
	DdoaFNXDbYq1o/1mP6k7Pjjn1lRO/Ke2yoC1Z3lT3jseRIFIDX1aRSH8z+rDxta6
	2+klpM7NvIzknsxMN22ZIOIpEoW7+Bf+ZZtcRsHfBSO7KdhCy1Cm0SUpF/mm2H7l
	CSLhGQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68jyr1ch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 03 Jul 2026 07:28:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e661ce1dcso7126185a.0
        for <linux-clk@vger.kernel.org>; Fri, 03 Jul 2026 00:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783063709; x=1783668509; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j3s/Lpz8eS/XYwHEj+6SabC/L38ujp0lZJpz7O7TgEs=;
        b=apgWzzN79VwiP0K5etY1JAVXATtBnIQvA/UmZ+q/sK7QdDHWRc/CR0mR31ZW8r/0xP
         i2f2KxxkdxmpEJSoc2DiuCwKVJv2rD33FGL+HVaIAZMhp0QuYa/M2ETxsV+BjGtgv02e
         b74+F3lQ36yUh++57qEG3ju7TOln0FcunActgds/roH3lbJE4R0Op0DWMj81+ar/FopH
         qSFpWHc7f+G9xjVZs14A+C4hV7DnC0qNi1uDBuAo1dKc0I7hseX3EABcHLaRcrSOjpOa
         w7UJTkr9yXEwtrreRfEFy77daf4IYDZfMHK9WMnKICbKDKHMwdXyqo0jAZPVeAkebhXe
         fBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783063709; x=1783668509;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j3s/Lpz8eS/XYwHEj+6SabC/L38ujp0lZJpz7O7TgEs=;
        b=kymNeeD1WbuDjJpJS28dcuriRdIlI0ByEdJLrJqn2ubTpKk1Skou/XImRinRDQ2GqO
         z+J+BiHmXoFwagxMT8E4AMXKdE0nElhQkvXPhFBm6zBn185DBNZhhu+trO4VctG599L8
         fKSb8Q9ogI8UCYt5d5SP59hywltw3I4dj8+GzG1U2kQu0VsVQs6o/HYxokkmbKXtvn8K
         Oa7dJrC/Hy1qGrUmZXFudd9BUjLg8nmBU2ZCd1/2drbJlOKbpa5fQbxbZzMrVVbCiNDE
         cKXdWxV+8gCknMLHIYogqBBESz5LKO8savM9pdbdU19Nqt6/8ktVqN62+4Q2BLaE4t5+
         oWYA==
X-Forwarded-Encrypted: i=1; AFNElJ/uP5QjylZIvRJAA/DhXoQXdafLMQWaL4IpzbT4yeA4An/YqBD9sgbl7aQ+zMnT6KXsvm0yQwggnaE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmGVPs3hOSJ73XxEi6D4ETkFy75Qi5oy74RjIDh96YXNFeTD/U
	DCUfTsyr9sflXeuNXpp3EYvvUvyNoSe24JCRPjrxRkvBQqQ/ZPxsODUjdlmctlAEB4GDcQ73Gu7
	4eIV5tvjG830Re63IO00tUKiU9hM2zdT4MU2dfoot0tlN38Nxt86vNVQe+VtXwmE=
X-Gm-Gg: AfdE7ckDq6uvFBd3oggsrt1xy7P8sZB4iza4Soxyb8HXI+AqD8x+0WQul2mdFXrGID1
	/HVVz8G4E4Yq1a/G0t8XmDGcM+g8qrWgVXqE7IEiTPBovIS3TyPmRBwS0vxxqKRpuz7HBDNv8eO
	CsK+0AbQkY+7X/JHs65wqcWKHzIaMv3is+MHmM8MkGaRGyaAbSP/ed26dLT7W3PWQDycdxyAm+P
	HqCjnH9IPAHmbMntuoAMkWUIUvFuECyTRuSUY7LhPMNLZNDZCyON1CiNBeVAkkVcl5yhUmdvI6+
	S4BeiWV05mtLRtwPy3RS4iqVGa1SYmWUAv8tJdRjQcsnoklzR3qUyj9I6SfnwXnE0XB557GKJ3S
	xojfpFKMlVYv5FpMeF7qbBlcAn1xnLxrbM1k=
X-Received: by 2002:a05:620a:450b:b0:92e:46cd:7299 with SMTP id af79cd13be357-92e7852f4d0mr764968785a.8.1783063708956;
        Fri, 03 Jul 2026 00:28:28 -0700 (PDT)
X-Received: by 2002:a05:620a:450b:b0:92e:46cd:7299 with SMTP id af79cd13be357-92e7852f4d0mr764968185a.8.1783063708545;
        Fri, 03 Jul 2026 00:28:28 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62c779dsm237107566b.53.2026.07.03.00.28.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 00:28:27 -0700 (PDT)
Message-ID: <47a7d008-9ab0-4e69-8d52-bcf856f7cfd3@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 09:28:24 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/19] clk: qcom: qcm2290: Set POLL_CFG_GDSCR flag for
 DISPCC and GPUCC GDSCs
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-9-cc13826d4d5a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-9-cc13826d4d5a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA2OSBTYWx0ZWRfX+G8JQDBr8S+d
 ZFIXsiRc2rwIh6F9Kair9q2FxEnymgDThd5Oh7IAodZhRcnPGFXRqsJsGwoLA9sHSIgsNU6kuoW
 W8ujBksBRp1YKUZKDt2bwAUDRsBABwnhIf9138Trk8edFhk4DtJg3Bto2Xx3v1PY/v4EKDn3UGO
 bzv9oYy4tTSjYtHhbLIbjRsPhOHRVRoq0uSDRDwdgV2BnbQee4MEQQsB66T0Lb7+KW+rtksRqDr
 KUA0GeGi0i+oS5tuQ9VK8S/MslTHnVgPR1/iGjzxMlJPtu++t4XmvcDEP9sOk42nLhP2qO12FeK
 jJ4mLwvNDsJiY47ad8O4g41weGAGMADZNh0UjXgah0Ufr4i4RGDruSvjmK3Tixj45oT2nbfkWRx
 Nbb5Oy4sWicBYG/td83L2Tvpfav3Lmb4EjT8YA4V6AVmL6Nj2sPl0e0HWl6J0DHU1aDuEZnJAQT
 udZDtY/+k/v01GfISMA==
X-Proofpoint-GUID: 9RNM3woVs0-IMCumOnalvHL-HX0116EH
X-Authority-Analysis: v=2.4 cv=QbFWeMbv c=1 sm=1 tr=0 ts=6a47649e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=wvqeoAhrr6bvGHU06gEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 9RNM3woVs0-IMCumOnalvHL-HX0116EH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA2OSBTYWx0ZWRfX4jdn2+yykm1Q
 gZXGV9Miaoos8zzh4QMUNe1IdmFCjJRsqj/y7Og3mawJGCb8vdNKQelAPwPYgqMyU5AHeQEqDTH
 LAia9yi6JWu89CdON+nRs/1FwLG62wM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030069

On 7/2/26 8:31 PM, Imran Shaik wrote:
> On some targets, the GDSCR status bit may not reflect the actual state of
> the GDSC, instead the power on/off bits in CFG_GDSCR must be polled to
> determine the GDSC state correctly. Set POLL_CFG_GDSCR flag for the QCM2290
> MDSS GDSC and GPUCC GX GDSC to ensure the correct GDSC status. This is not
> applicable for GPUCC CX GDSC, which relies on gds_hw_ctrl status.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

Downstream doesn't set that, but at worst this should be a NOP..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
