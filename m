Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B4030E83C
	for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 11:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771415904; cv=none; b=mUddIV0NJfCxvBIIQh/1QB8oyUC4e4md/S9bjsiEgfDoGDazTLPZLhyspJpX0pMOCnu0ufXhqTZIbvIyVKmzEjDJ1nP7xXZSntdQ2tA1pPlHXPHPSdNBGDYZ29XMXRAhG1iNv1c7pnzXA8a7sfnnxFlUEcIXxIVmDHMC5sDrlB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771415904; c=relaxed/simple;
	bh=NiFhB2AG+mWGtSKo1xUEoKf2XEIkJGZAG/sMcxQFnf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eG/rA2MwHbqdj+5LW459ZXPqw6rEfXN+aBK/4Q9d7i6DKk/mubh43r3g/gzVBf3jQJe7DAk4ZKY5E5I2cLS6FgwcVQHByYFUYguhQHM6KVZ4WdWEyb7MUBccRyJmV8ZxZ9ze/uf9P7Oa/PmKq8tfKzJHjonR+k3CgoCQY/L3e3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lR/BJoGA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hpoJO1YC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lR/BJoGA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hpoJO1YC"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61IBcsea413923
	for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 11:58:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gr9/XAIstPahfqY/E+i3reO+
	rg8IoPQG0UJaDdYYkUQ=; b=lR/BJoGAE74gqZlhGhFTKf3JjQGaE4LHXgxDeWXo
	xmuULSE3OtR0I4gf3fS8lREyYm3TtIGhG1CzeMxKjfJtHJ4Mz7T9i3kcA+4p4m9X
	dsbDYTkGyHMMlycmeSM1CrXpIom+W5cFjGQP7d7L7LgAg2ANWymn8ndBtoXbBngu
	BD3GHGf7lUKchLeBaVvM2K6XD9m6PTLYv1P9K1hEqXLXbqafyPLKS66aw5zPxA0i
	XOAMis5GcodMy6jkbKDICYbCsmUaNnpGvlrlGRqKxBzAiizAEq44asaKn6euDC7b
	kI1Ei+/huCGpXfGPfUPn+A/8ZyFub+Wrb9oMHrS0t+CPPg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cd1q6smfr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 11:58:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70d16d5a9so2930007385a.3
        for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 03:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771415901; x=1772020701; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gr9/XAIstPahfqY/E+i3reO+rg8IoPQG0UJaDdYYkUQ=;
        b=hpoJO1YC27CIn4JuH1KsWnDLQHqFH6WsZw8/1CfhXSMpAHz81pn9dJVK1/6j1fiYf3
         sPQnT/U9GstMmJRgYgvD54WkbK84gicPdIuFw1dT8M/G6dvoF4Ndyqt+UGRb8mc3gUqM
         nbtlzzOOwsdmVtOXH5Xd+Se++0wXllIwK/X3MrIMUM6Y74fNGG6z0Iq6onGLApx+ld6p
         pi2QflbKeUWu+tlyUZyzDg3qYX0CtnUNs2GeRAUH3EnK5Y5vKN+A7qrdFAO8oCOyeGbY
         xmQtRnJwt9cAlUBPdgxcXoYnPRp2s9o1ohFRfypWUq2oZWsIr1BTMoNsCt3dg5TCgk8G
         sXZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771415901; x=1772020701;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gr9/XAIstPahfqY/E+i3reO+rg8IoPQG0UJaDdYYkUQ=;
        b=lZ1hbGe6l1NT3vRySmKJ/WfcRuS8Xop57u50XMftRt+uKV+GmM8jmq1YW9ehALTuGm
         nu0nF4ij78CxppCIoVoqwP9YCyfL2v4SdXH9ECyn6g+MAzKzQTtw9z/fk0/jMVOFYEbb
         eUsewdm18l9odWqiot92jp73ZpXkXACAMGNCO3CzZDpC/ApUcCfPxdfC3M749QUMyxey
         XWI7Lggse7xQMwwsefqzoEVrtJ5H9MvNf8STLehfsHHmJIJqfXdl3wE/QmeeqaYjM+tY
         739i7CzN/OReazWPUo95S8SfLaGbPNhDADDuOPhEf1lPfM31CSC/zeX1d7IWkCBywpEz
         64LQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXXCWtkiPtIoDci/NOLSdy/kYwKciUbs3gkIOAhkGvc+kImg3LV1OgonmCDE2/8OYVUkb/V4OV2ws=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQBLBv9Mxy4+ETlvk5qpiOkbVBI8Ht2oWmTwX0t1RCfeR0hIJz
	i+VVKV51vqOai373NuYPWa1caiRiD1G9gIDg3zUramdeZj+cZNwcZJ2ot+mOmAqr7k1Owhe8cBV
	yNNbYx0oTmzJqAJdvqGpr/ZItK8tOuWFL5WEJ4rD/v7p0Re4dgpzeoz6SI+8gUWk=
X-Gm-Gg: AZuq6aJPTN4LNepKuyBmPZD/bD2JfSfOnTXn1SOJBHsK4vBvu27BD2vF0l5u74pl1cB
	rzFFoWd2GpG/9dlGkdLe5BT1ZoULvf0dIj8IeqqZtb2mVMMK5vPnKOvgGP+oqAco6G9WPl7eNJX
	0WL7Qdkn2D5kkVTM+v1aueCa7l+jbdubQOsB3w2wDrW0MzcnO2LabvmNVlOAAKvyLVMvzCIerSv
	bevfJ2HsD9DMQrOlarcNPu+J/YX2TXyN17q0JAeaP2bFFX6dF6LSdPx5NqSZUgy2bp/6EMIYJgZ
	6oyj3v/EYAG5XbURcT8AUZS9+xHR+Otv7NTr7Zq5rEZkaF75skoquBC9s+XWCRHarEQQA+xqH0o
	3XVhVHtIVY+eYedSZHsh/jPiX6D2wUpMLFiODr0aashDeZjLlgqCJlKsDfJAaHRXYW/mrjHp2vZ
	a9WEmM87manLhCIRpjr/jpCkxCeZCWdNCMfUg=
X-Received: by 2002:a05:620a:410b:b0:8c6:a64e:92b4 with SMTP id af79cd13be357-8cb4c039b28mr1747937285a.78.1771415901169;
        Wed, 18 Feb 2026 03:58:21 -0800 (PST)
X-Received: by 2002:a05:620a:410b:b0:8c6:a64e:92b4 with SMTP id af79cd13be357-8cb4c039b28mr1747934485a.78.1771415900728;
        Wed, 18 Feb 2026 03:58:20 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38706916f7asm44157521fa.37.2026.02.18.03.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 03:58:20 -0800 (PST)
Date: Wed, 18 Feb 2026 13:58:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: David Heidelberg <david@ixit.cz>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sdm845: Add missing MDSS reset
Message-ID: <ljser6u4fd5qc4lxxde77igtxz6ertbeucsg6s3zbwlykfowpj@yf7h6tqh6cik>
References: <20260217-sdm845-hdk-v1-0-866f1965fef7@oss.qualcomm.com>
 <20260217-sdm845-hdk-v1-3-866f1965fef7@oss.qualcomm.com>
 <590f75c2-6418-4d39-ba7e-589acdf98786@oss.qualcomm.com>
 <e43d5bb2-bdbf-4439-933e-36591dcfd3c1@ixit.cz>
 <9405b67b-9e08-472d-a937-38c038fdf73a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9405b67b-9e08-472d-a937-38c038fdf73a@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=K60v3iWI c=1 sm=1 tr=0 ts=6995a95e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=SXzkmgPmAAAA:8
 a=VwQbUJbxAAAA:8 a=OL8-G2NCgTYwbf1Q410A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=EWLf6cg6Bh5aS0AxDgDu:22
X-Proofpoint-GUID: r7VSP6hR1LnlE-OAywQyr_EZI1kiVNv1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDEwNCBTYWx0ZWRfX3pw8qGLcwra6
 g+cKi1DmUl4Um4dDKT3VdHqWoSdAV16/+KfCMxVlAntVNyaeg4ybIeIIEy21WKig4GBOuHj/sf+
 bPLJ/Ea+jZR3avBFdYryq1ulzb4F53wtL+Rglt0g/FAQHcRB6LTRoobuUtQ8ndfdeQcS9q0JUSI
 11gathULLu1lKBVVgD2/BV0oKqxbDuGBHpKdF3Z9WsG7rQP+yAZwf0WERKndSlFLXJd+lOrtgnk
 k1D+IZGdnNXAT48yNIojXlnlV9DN3Hk46zgV5RrruKv4odUR8T5bT03MwsznKnhlryBsuwD8+qv
 q8GGm8/U53Xsrs6PosWQe4iLCoIWM1QEjGbbJKfnmev0whQbV4nj4mqG+MIutdQQBCLEOU2w3Zw
 sTGIQIQu9GeXm1mj5R/JlbG8Czfit3+yIgdsXEhXeyQ/91w3kc3+UCjjK30ZChbduyodzLUhxSA
 Sm7JpXYy2XHcJjC2s8Q==
X-Proofpoint-ORIG-GUID: r7VSP6hR1LnlE-OAywQyr_EZI1kiVNv1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602180104

On Wed, Feb 18, 2026 at 12:24:26PM +0100, Konrad Dybcio wrote:
> On 2/18/26 12:18 PM, David Heidelberg wrote:
> > On 18/02/2026 11:30, Konrad Dybcio wrote:
> >> On 2/17/26 10:20 PM, Dmitry Baryshkov wrote:
> >>> From: David Heidelberg <david@ixit.cz>
> >>>
> >>> If the OS does not support recovering the state left by the
> >>> bootloader it needs a way to reset display hardware, so that it can
> >>> start from a clean state. Add a reference to the relevant reset.
> >>
> >> This is not the relevant reset
> >>
> >> You want MDSS_CORE_BCR @ 0xaf0_2000
> > 
> > Thanks, I prepared the fixes [1].
> > 
> > I'll try to test it if it's not breaking anything for us and send as v2 of [2].
> > 
> > David
> > 
> > [1] https://codeberg.org/sdm845/linux/commits/branch/b4/mdss-reset
> > [2] https://patchwork.kernel.org/project/linux-arm-msm/patch/20260112-mdss-reset-v1-1-af7c572204d3@ixit.cz/
> 
> Please don't alter the contents of dt-bindings, it really doesn't matter
> if on sdm845 it's reset0 or reset1, that's why we define them in the first
> place 

I dpn't think that will pass. Current reset is defined as RSCC, we can't
change that to CORE behind the scene. I'd prefer David's approach.

> 
> Konrad

-- 
With best wishes
Dmitry
