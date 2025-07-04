Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D99244686
	for <linux-clk@vger.kernel.org>; Fri,  4 Jul 2025 11:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751627179; cv=none; b=pOwcsQ+V9+tPnfGcCa3QLjgZNFVCMsMNuOkdX0YgVCQWpPs8UEo5PC+AVH9NmsfOmJ9afT0XQ0Ilp6fJrs6yusxaGfaR34MTgHc4IkkseYLrLm4IC5fJnoClV0oMEVUtU+EAp5NztBVm/su5Ddda+Z2pHLvtP979kQpIDnc7k34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751627179; c=relaxed/simple;
	bh=k3yRpHVV4mG8PD+9jKn9SDf4cJFDmVdprG2GMo1cjKo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=opJAqwvIS+qm+HFMm6szm4pSR07h60r3wHpZs4/ksCWK7fCeJ0SnmWbdY1zElHq0v9Fmtr7fDrObSvJ2NmDBZPbbwE/vUNc86am8OfY7zVOmTVLiTQglUrv48CcyPUGRP1iSWnpltgUkyCOFTRC9R29bv4kr6Wg10j8n8XuVTEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KEOiVfWe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KEOiVfWe"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5649960r032762
	for <linux-clk@vger.kernel.org>; Fri, 4 Jul 2025 11:06:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2XxqMM/RSUTF2mZkG2gocViLCUQzGXcwFWZuP+ol460=; b=KEOiVfWeA44SOaKc
	6xYZn8C2V3e+4xKSoxAAbHrk58XEX9tJJOKUl8s64JK5RUgE/AAqRWONcvhPBOdQ
	hmrMgLROzm4Mv6Ca4LCOkWwop1V3Oyf0WV5lJl73s7yHeFcM/3AReTWNYk6qHqgQ
	TeFALwk5GfIJpbaK/QB392LjbHHSVISiCk6T1V+61HoBPTUwCa6isi2WVSMGf8oF
	UezQGSf17DhbDnaSq8vJnL/WbdIdYcMyYMHUXywvMRbQLuJNCOeSh8JB74nUEgy3
	c40wF1Y83sy88TSPyckG9u6irCEUJi0B5O1TGop/4hm5ZnhULOXxnkRQRgvP61wf
	d76bSA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qmkgwx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 04 Jul 2025 11:06:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a6f59d5ac6so1513831cf.0
        for <linux-clk@vger.kernel.org>; Fri, 04 Jul 2025 04:06:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751627176; x=1752231976;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2XxqMM/RSUTF2mZkG2gocViLCUQzGXcwFWZuP+ol460=;
        b=G3Lqi554zVUoJVCwmXywm7e0yPvavAbIRvZZb9BnUCKvH6inC6tTikGBiuqj6W8NqK
         MQ4y8zeyrI12rYGW/AzcJzmtGUehAuf8gsIpheiygjb5Bfj0dx4gQT1NMp1480OvYtOX
         0ScxHUocpVTiKLPGoHPvL06AB4lw9Q6uWCVhR0vV35etGPccajZpVLNiQ/SNseIYxk8j
         lfy8tadNQpML3FDMgfoOW8alfh3PqPdduqZaBxW95TLWnLqxOB9SoKbdZvWl/R2W4Lc6
         3/Ei2vvnl+qofrR3FjVjDD+CiLZx3SO0BFXJ42y34pGn/1mi50M360X5TnmcZRCaQtG8
         GNYw==
X-Forwarded-Encrypted: i=1; AJvYcCX/qoe5erstCj1lrL9+pEmowb2iCDXFLk6lWW9xX+p06UePNzkVvzBDCiBBe878glBd+G0vwm6p/Gc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIIxVHYlTYfI2TuiNjjpjphPkVhg0AcjYAQukmWETknID7n1tG
	1ZwMM3DiKLzoBm2RKpBYOMatI2r3i2C195zZRK/uFDRua9VVKk1zlEwi/WvpBsIKosoGSyB2h6A
	77e08jtAaEqR+eiuUU91gn6aGo6wLQrLWwy60qfLXjMLsENhSb5PKBLpidBuNYUE=
X-Gm-Gg: ASbGncshr8iQx5BkUzShP30WiAbnFZ0x4zgl6ig+pbpF4Jw4+whhsN9+enwTXZL3wWd
	ZqaJ9OOXUI1BWKkyfafGc6SKj9JGycDet7eZpcavyXuVntB2YK48rkrrB4l6IDwP+EyxUsBXZEQ
	8nH9uZU/XThl9LHolJhtjkNXQz2Tr3b0DBmLZl3lRVPupLx48BV/NFzWGltC7OvBNUcY3gmJfGa
	T2jrPNtP0tAXnjIDeDwGsDEAR6nOzyejqtxciJ3V1+72UeB5vd8amOYOqZI9pp64u9rgz+G56hu
	xH0a9I/h4JS7zW5iQOrH32rio9GMSda/84oX7DFoJLHarm+yBbz/vIqzngyXFEkTfpP3Fa5Xh/f
	FYL7YkA==
X-Received: by 2002:ac8:5fd0:0:b0:4a7:bed9:524c with SMTP id d75a77b69052e-4a9975cf1eemr9429611cf.11.1751627175932;
        Fri, 04 Jul 2025 04:06:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEL00AfasMKdltGMxGM974NBZd0imq6S1Dc9fbvd0ZKYoSfNqzbgVRMjgXDHONPutQiSOAFdQ==
X-Received: by 2002:ac8:5fd0:0:b0:4a7:bed9:524c with SMTP id d75a77b69052e-4a9975cf1eemr9429321cf.11.1751627175516;
        Fri, 04 Jul 2025 04:06:15 -0700 (PDT)
Received: from [192.168.1.106] (83.9.29.45.neoplus.adsl.tpnet.pl. [83.9.29.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6b02a23sm152666366b.112.2025.07.04.04.06.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 04:06:14 -0700 (PDT)
Message-ID: <0e13833f-fc0c-4bb1-a1e4-fdba07c50768@oss.qualcomm.com>
Date: Fri, 4 Jul 2025 13:06:12 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/11] clk: qcom: common: Add support to register rcg
 dfs in qcom_cc_really_probe
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250704-sm7635-clocks-v2-0-9e47a7c0d47f@fairphone.com>
 <20250704-sm7635-clocks-v2-1-9e47a7c0d47f@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250704-sm7635-clocks-v2-1-9e47a7c0d47f@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=6867b5a8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=qmfFy4ndMtQ753Zl/n/b/A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=oQRPDSM0WpIYGLKzx8wA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: PlsIZHTEp3QTGYYMAlfnOvNfnbmGa6Kq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA4NSBTYWx0ZWRfX1W18pjoKWdkB
 RHkUCHpHZiISWKYMWwKJ1iF5/jGpefmmNuIBDdgW7+NaEg7tquStbfJbHloLrRqq1VFGLaePoKg
 Pzm+w7kytzVJ6etUiUxT9TwUY1u2+caevYAoCK48eQ6YI0FlpgPi44UhCPCHKmLhXlotWwIlEKe
 3eHJOlasBaRFwhmwl7+1jZw3LV6SIkDM5jhbeZ2zviFm/RnimXe92fec98DHSTqU/DAeqOd8Ap3
 kIQicaoTnGBDSyKYqylvQYd3nc94QTu+neQN+tOvX5D9Gz+ql3yw1U2IjV8RYSRbqYSK9HH7Uiy
 9fa/laEiPbpwVZpb5WXDoZV1p+mVshgTWeV+x2K73pCFX5XZ5/0i7azD/wyB+Cyu86kn/RE+snr
 sDLt1yK8RAwD8rnrSFVUIRKpBQan6/D69v6bxmJvHfbIfoEilKVY4daoGVBsSTo3AsHCvDeO
X-Proofpoint-GUID: PlsIZHTEp3QTGYYMAlfnOvNfnbmGa6Kq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=954
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040085



On 04-Jul-25 09:16, Luca Weiss wrote:
> Add support to register the rcg dfs in qcom_cc_really_probe(). This
> allows users to move the call from the probe function to static
> properties.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
