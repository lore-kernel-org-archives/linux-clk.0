Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F28223339
	for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 21:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758835125; cv=none; b=Tu2OZRlsMVVsZfhDUZAFYUM2UwWK9BFbmk2WJ8GwKeHS8oHp+Kdcir/HJzj8LSVup6402P8HwgiXmmg31aT2mW3/+FNVNGheN/lPwyEhjkUElya1oRVGhpz3nUnV/L9AUKaCfvAUH9x2E0py+12a2FqjD6p5w7Unu2e9meidS24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758835125; c=relaxed/simple;
	bh=2Lol/jwFlRlRDQmZIWwyZSfVkv9AK1k/8suhcfwYTDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ABJ11MmT5ws0D/H9+fI8F5lPbYDFsHaXTQcpFPdWh3bJss0IVd22HlAhFyE5PdsOGON57U+xRl9Wwj+GYVm7dIL4bXDJTp67O6p7FxPkUQT6M6N6es5ha0q5PWIdKdYSh8MsUIic7u+tk5iugpN1aRfTtrKxRvCDHFQOu7MH8es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Iz1k6V5L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Iz1k6V5L"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIPbrR011343
	for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 21:18:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ONK/ehfCRnwh+PEloQIg2H/k
	gpQgE0yXQ4dQUN+K+DE=; b=Iz1k6V5L8X8zSYzJnTnRih1RR/CvQKBEeyfeKcRs
	eK4j7n22OB0Gk3Ab2rzFppaY85RCaCG7KzZsqCQ9OetuLZMOFULq1ImhUcr0lfeX
	zpY+4mEos2FYfMnrl9bCsFzTH9iURFbx0DX3SynGXk+igZ95eJ+7K/XOG+5jcVYI
	1R1AOLPn/0JxSUPS3Ik4Rs6ABBGhk2BNUAjFf4tyBNn82R92Hkoq8CSzXAxJB4T+
	EAcMa1/HMCLqhvLZSP2weddmXyU32uC/poPm41R1UUMgdwBfJjxbnArnbe6uhmux
	qrzNM01UhzsiFQNe6kLDsxcSTiUzLJl1cXoqrj0pqjl3Cg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0q0dxw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 21:18:43 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4d435215956so32632531cf.1
        for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 14:18:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758835122; x=1759439922;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ONK/ehfCRnwh+PEloQIg2H/kgpQgE0yXQ4dQUN+K+DE=;
        b=CGzpmwCz9UzpNelw4KZeRMIKw4WlxHbqi7XaNDNr5T9drtredc3Z7OIWobQDCZxWtZ
         LeYDk0foV/QpyZXBaMDzVSeIwNfNLh0/UxAs9HONSmcygNelQ6uGqY6kg1VNUwUT4PX9
         4O2CrVZkrakgmscHMOCHx6hongDcrVQzC4jgb70isZQoI3CmzggrlSeqs4GaUInbRFBx
         zFIT/0FqZaQA0mEBDLiLLsDX/jag+wvErT0BLs2gmQbJZaQ4pF+ETi8Ug3J4LMEhI2pU
         Cvj9RRiZgVaH4h06tY1UfqqkNbiSIubHZxKXDm4Z/4ibgHF2HY6cCKVMLVeSSwAQr2H9
         IfWg==
X-Forwarded-Encrypted: i=1; AJvYcCXGrXakAhjTZ01B8GRfuJbSWvRk5ixi2/zJ1y5NlhtIlN0cfPn5eMQIaEwYgjO898I8bHGh8nMJT+4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzULzd1jM6afbwm0h/931znBJ/UEfonSSWOcB56RvwkGMTBy1rQ
	i2L0bCpikx7LbY+O0Hn8HBEQEQ38HYD+K31nyAUqSj8WhZFQgLw3b24pTwASPtOT6bVVv1Md7i4
	bpas2mHA5z1lJtSjrqRN12Ikcu8hjwIugsxekdgLhsPg7e0JLjUzjLY1pScLtnJejywKDcbk=
X-Gm-Gg: ASbGncvC5EfI5uVk9VjPqZ5FzQf2m/9ZlQek04acbfEe8uAIo9mGcYp/5eFIfSsqNCN
	A2sXBeJ05nOG10nFpOKTPRos/0fC8w24IYXKPsdQL0h3IbsgRwkz5XYdO3vo85t8bPqqXChPFMl
	QBlye7jul9rQgV+fTDe2aElH0iPZMgctEXj91TzV1duOg96iVWnS8N5FoDo94hCBHiXcLG2gR06
	C3xMS927IfIIrd+cRelmbQE8n0XuBOAwYbq7xyRXsGe2gkaAHg0QhwBxpq4Bx41hdhlhshDj3e+
	BT9vcrY/9qe5k7OuiEbxfjB4VyB1HYUfoX4V2LC5IpfUD1Po+Riu2xc2KTazZvKD0sr9z2xAntE
	tEXQzEVWiIOMCiiCPaTY+IcD9JEQk3seeNEIZvBT6hJiC4TM2WipH
X-Received: by 2002:ac8:5f84:0:b0:4b4:8e38:8f96 with SMTP id d75a77b69052e-4da4d8e3cbamr67547551cf.83.1758835121915;
        Thu, 25 Sep 2025 14:18:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOIVqa2gETc2ZY4pIZvP+T87s4pG2HJ9V3nKT4AFBT6EnF6nS2g/NyJP0rZCIThsMm7bjqfw==
X-Received: by 2002:ac8:5f84:0:b0:4b4:8e38:8f96 with SMTP id d75a77b69052e-4da4d8e3cbamr67547181cf.83.1758835121417;
        Thu, 25 Sep 2025 14:18:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58316a32638sm1089553e87.118.2025.09.25.14.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 14:18:40 -0700 (PDT)
Date: Fri, 26 Sep 2025 00:18:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: qcom: gcc-glymur: Update the halt check flags
 for pipe clocks
Message-ID: <gprk7uhwqnj37cyl5iae64qrevkts3z266y2e5k6z72bcujhml@n5yaik3jtm2a>
References: <20250925-glymur_gcc_usb_fixes-v2-1-ee4619571efe@oss.qualcomm.com>
 <9066c8b1-bf25-4ce1-a0ee-16e9ab44dcad@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9066c8b1-bf25-4ce1-a0ee-16e9ab44dcad@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: mdb5tONeyKO12kF3daI5YvLGqXGmqE6A
X-Proofpoint-GUID: mdb5tONeyKO12kF3daI5YvLGqXGmqE6A
X-Authority-Analysis: v=2.4 cv=aZhsXBot c=1 sm=1 tr=0 ts=68d5b1b3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vSrQadLftwdv3iUH2wUA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX/nEWPwbPTOpr
 rRKDRmAYxWeRpxcyyhC1KW22rRTM/2UoDP7yvtHIGsaH90anueutyDFBDTNaseLKdwM920sl2z/
 lmGNb2xya0NgZXbRDgYWWWrJpTeG1hsqg/XaCedsRF8h4TNYKHgCsOVqlUM+MEpE9utVGJkrO5K
 wNi6moQy6Sju7DYXp9fSlnCpXf2fMuNCRIPxkRNzyxZKQKgsaAWbd1y8gHALwGnCyQINmW4iklC
 85+Coip5xTBL7KciBLCD5AgptdU9GMsd98I0vzF+ghxHJi4c6Mz9viLkmtEtwQ0ia7Kgpmvqz6/
 T3Kx38gLRz0N3Z2yKLD0fW2/IWPuQmaIWqtK1EY1Dt0RlzkeA9s4jMICN5tR18rvQbzliDZ+Kjh
 jPOak85nMFXC6oeIYKYcHriKGaZ/LA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_02,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

On Thu, Sep 25, 2025 at 07:10:47PM +0530, Imran Shaik wrote:
> 
> 
> On 9/25/2025 3:49 PM, Taniya Das wrote:
> > The pipe clocks for PCIE and USB are externally sourced and they should
> > not be polled by the clock driver. Update the halt_check flags to 'SKIP'
> > to disable polling for these clocks.
> > 
> > This helps avoid the clock status stuck at 'off' warnings, which are
> > benign, since all consumers of the PHYs must initialize a given instance
> > before performing any operations.
> > 
> > Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> > ---
> > Changes in v2:
> > - Update the commit text to add the SoC name "glymur" [Konrad]
> > - Update the commit subject to add more details [Konrad]
> > - Add RB [Konrad]
> > - Fix a typo [Markus Elfring]
> > - Link to v1: https://lore.kernel.org/r/20250924-glymur_gcc_usb_fixes-v1-1-a90568723e64@oss.qualcomm.com
> > ---
> >  drivers/clk/qcom/gcc-glymur.c | 24 ++++++++++++------------
> >  1 file changed, 12 insertions(+), 12 deletions(-)
> > Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>

Note how you've responded. It will be ignored by all the tools. Please
send it correctly.

Anyway:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> 
> Thanks,
> Imran

-- 
With best wishes
Dmitry
