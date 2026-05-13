Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D32342501
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 15:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778684914; cv=none; b=gfwMl8d4mgtK07hYJ1oUeEwvh0ZSQ1sz3zLPo21iqd6S2W0AuN3NRZIDxZaFdPr24J4rfgqkBy5HhIeelgUYfg6uTInCrIcH4F50GTF6tz8hfwEAOooEtp4B2xXhswOO5oaTBVgez66j5zPvUcozCaB3lwz+JNj+8FNEU6eTUlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778684914; c=relaxed/simple;
	bh=Bd3ZwhvJbwUOkyYRn5WcBOZbyngBpUARU9qYhCZjEKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b8/OswsvaUSDW6nEO55UgfILqzjvAL2/Yvpy6HAvOHRpjzOqff5E2PQ1TS+xQrUR5SsveAfsvfZZvoX7cRDO7K+ogdHJELTftLYOQpCyIOIzOcFlW1I0KFwIeLX7jETDfa5F9LaAG1tQAIVJlAwvmoNy5TP+d7RijRVTB0paRbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RBQNphDh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U5tTh59C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RBQNphDh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U5tTh59C"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DC9OsJ3324677
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 15:08:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oq4En/EEKAWtrfaB8fIsQRpJ
	JVAeT25AyzkQ5liq7ls=; b=RBQNphDhZQsABdTWlpczPTgWzVnUtmACc7/X2+vB
	xher6gIaelmzD0UC2qkU5rFyL8ndBtJbNWy1ej+b1bIgFXYGKIEi0VY5zIXxDReG
	q1seXW/QAAcsvw3rc5VAk/qF6Thmtza6N4Zq9l4XSNi9NzwPFcN1ev2vyWucQusY
	2wgcph1wy8ceu6MVB9t0wUeezybOxB6C42AzYMuUfmjCSI/Eh/DN/0I+LYxADnld
	Gh1NlqGSkZfmNfue2/H2qw9gmup9eY5awmUOMqesrrIWRl3wdlm4imNpQdiAhuq9
	cdUgarvEfEVVAGeeINOfyeFV98oPr07Cb18bV/XT1EsGdQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4kvda33a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 15:08:32 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-63146b7289bso8712327137.1
        for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 08:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778684912; x=1779289712; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oq4En/EEKAWtrfaB8fIsQRpJJVAeT25AyzkQ5liq7ls=;
        b=U5tTh59CrxaIjyNhbESHhB3gAH9KRuY08AtgWMKXqh+sSLvbxFN51w5WoJr/f2JuoQ
         wFrLQ69Zywl34O8dhZqGTNIgvwXA+DPgArX+X2tjgxfYWsfzmW1e9LyXvlV6Y2PEkjjR
         psxa9GHxHYIbQRhmBMYGz7C9KZtA0GpPN32ZU94jin27XBr2RZi00JBEnFj1VQKpHb+b
         hoV0aJQ2rUZH7dBmVJOTD0f0xhhUIVEsdJNswMlJ9NYHl76YuozIxTDWsNmOHSkOlMax
         FONFAzV7XESKSh60Qcmor/4XGVtg8JeTeMi20MiTSUHr0iAQjkpWP4usFgji4b9epJ8N
         bBvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778684912; x=1779289712;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oq4En/EEKAWtrfaB8fIsQRpJJVAeT25AyzkQ5liq7ls=;
        b=KwW9MvRTYB0bU/K+zADDbU0brRK9nvnV1WrJfd7nCJWlWUdJNoIyIJocEYPzcliptn
         kNyTO4ItEhb0YSwwPxau2Y7RFZDG3aR+2iEHoLJt8Z0CLWkVtgFVGOdFEYDNysixdDVW
         enQr34VpsfcnwAxk/ywiAhnNzNM9v0J41QN6XhcVfVIt1Z4TML/3HHvfiSCFI/Dm6RdG
         R1rEG/oHVo8wf9CNqMncjGzANohmNECw0eKi8DkiANlbb20zQTDNOGZ7YIdHE/u1UO5C
         OOF7xAtKJbw87WBYO4cfg+Yiv/kVMqPnEI5WvRigT1TLVzDoq9IVmaK7e8DmU5AzGclW
         ylAw==
X-Forwarded-Encrypted: i=1; AFNElJ9KTS92e8gLj6VvEL5wqSOfIWXZHMTu9EFSjBGHfp1y/Woul3LPf/mdjTk87051wnsPmeiFMHbu1MM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxtu+aGiWRZsl+V97VHSHSsYn+A72KaWrQkPoX5WbGPsJjthX5E
	lyGXaJMNtp6OCaTXkxjrGgy+nxbDVWB4BOIMSjqOP8TBiwHkYC/5uxdjkl9F5YQXykJz6D8uqIW
	cKx2cajaLjKihACNebPvXSPfVG1UDWmI06/VcMRcjDb/9ig8B3JzsQmtnvAm7SMk=
X-Gm-Gg: Acq92OFryKcxCKhkp7648np1PiFIf90vh/5tNgZV5xUckfzQvuAOphNM0/5ftG3Ddgj
	IwKAr2Ax58nncf61newqWbR7XiJqai0s54yxcfzVefNJAOipto5w0P1iydERzY/t3ITQvx2TBa7
	rHoY5EWUKV/lA4bidMa2rbb4/FD7zncFyZ58/vXEHHkmI5WY4dkj5rj86MTE+FifU6ftEmaIzcO
	L9qm3jNI5Iu6Bfkns3K//qlhYoF1kUAKMr3V6x/jIh/NAL0hXtJKT4fHBrbvkoKbDwvpQIE1OCb
	API03RQRKSdIXpaGbkaYlg/TF7q7cZbynOa1hHT0PfyhGA8ioXkvOSfGNSza7Lh8ow1p7AwyGzT
	Nsx5AEKTJxZu0VLJKxhWSpDa3AXmRqtgReyzQ4R0UBplogoLD/4/0Oqr5aUn964va4fXwWletlz
	VYcsDkFMYb3+NBjDZdYCQX8kvG3r1Q81B142M=
X-Received: by 2002:a05:6102:509f:b0:634:2450:7998 with SMTP id ada2fe7eead31-6376164cfbemr1420098137.4.1778684912092;
        Wed, 13 May 2026 08:08:32 -0700 (PDT)
X-Received: by 2002:a05:6102:509f:b0:634:2450:7998 with SMTP id ada2fe7eead31-6376164cfbemr1420045137.4.1778684911658;
        Wed, 13 May 2026 08:08:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8c66facc2sm2652914e87.22.2026.05.13.08.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 08:08:30 -0700 (PDT)
Date: Wed, 13 May 2026 18:08:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] clk: qcom: Add support for Display Clock Controller
 on Shikra
Message-ID: <qg2n6pwjcoz7262eylept4mec2l74h2owfbhjykfxap6qwgzuq@oawiwgok4hhi>
References: <20260513-shikra-dispcc-gpucc-v1-0-5fd673146ab2@oss.qualcomm.com>
 <20260513-shikra-dispcc-gpucc-v1-3-5fd673146ab2@oss.qualcomm.com>
 <n4wgnno2td3xmdsgwadvdtvr4ncitzio3ufufg5bp7wnga4ouw@mj76764e3uus>
 <dt5j7khzvgoj5qdrnfoi6ssye23jve5gjta5qx2ubuvufjzr2w@puacv5jgosmb>
 <1cf064d0-14b9-489f-964f-614aeed4fcbd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1cf064d0-14b9-489f-964f-614aeed4fcbd@oss.qualcomm.com>
X-Proofpoint-GUID: XaXW0vVix9LvwnkWLOCj4bacjWXa3BBO
X-Proofpoint-ORIG-GUID: XaXW0vVix9LvwnkWLOCj4bacjWXa3BBO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1NSBTYWx0ZWRfX4vy/SkVN+aPb
 gGxFjctZJFaQfs2j72DZIAet2fUEC2TrUILnou57v1NuAVAQ48R53RUyZuRI9XauoE1vxTx+gJ4
 lPq9kn+pBVYY3Qan2NVEHCPtcFZSplCbH1edasIWPn+2PbhGVQHtoo62OXiPskeXLSqjnExG+UJ
 eA+mc6xRKlPsNtwlPMJYwMfn+Z+cVIOcUoSbQvTqHUbXEG1GHDAa+zA2rCEMHka9QtX6zZrXo91
 DURVeS8tVIsVZO7RXdiVnZ4zSlOPR/1zUf8pPSD2wHpq8I/tdrqMx+DSLqeEOOqQzTFKWLshgRQ
 KEcUQeJYZoOPbC1Jf3/d0aUd79BD41+Uy5AVdzE4Y7NBlSCoxjAxDQfLwdDUVe5ilZujtVFfdaY
 QIVgIfCf8ASw3qk/5QXl7w7zt2eu60FYn4xXjqJye5EAAnY7HcaM4aERdZwCmd9LPGY1RPGxmAx
 bEQqMrv44pQlxRYZwXw==
X-Authority-Analysis: v=2.4 cv=Iu0utr/g c=1 sm=1 tr=0 ts=6a0493f0 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=bIcPXSlWc8kKIrlyHW8A:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130155

On Wed, May 13, 2026 at 04:51:03PM +0200, Konrad Dybcio wrote:
> On 5/13/26 4:06 PM, Dmitry Baryshkov wrote:
> > On Wed, May 13, 2026 at 05:01:16PM +0300, Dmitry Baryshkov wrote:
> >> On Wed, May 13, 2026 at 07:10:38PM +0530, Imran Shaik wrote:
> >>> Add a driver for the Display clock controller on Qualcomm Shikra SoC.
> >>>
> >>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> >>> ---
> >>>  drivers/clk/qcom/Kconfig         |  10 +
> >>>  drivers/clk/qcom/Makefile        |   1 +
> >>>  drivers/clk/qcom/dispcc-shikra.c | 565 +++++++++++++++++++++++++++++++++++++++
> >>>  3 files changed, 576 insertions(+)
> >>>
> >>
> >> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > 
> > After comparing the files...
> > 
> > Can we use dispcc-qcm2290.c instead? It uses clock-names instead of
> > clock-indices, but I think it should be fine to use clock-names as a
> > one-off.
> 
> Or we can convert it to use indices, since those are stable for agatti
> too - the names would remain in the binding, just unused by the driver

Either is fine for me.

-- 
With best wishes
Dmitry
