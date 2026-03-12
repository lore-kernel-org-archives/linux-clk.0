Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13A63C554A
	for <linux-clk@vger.kernel.org>; Thu, 12 Mar 2026 13:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773321259; cv=none; b=XOEcpYKh0ee6lt4CuPeGy86jis+MkMx6F2mjgaO7qP81RGePCYIzgL58dumo1YNLDF6qCQq/xQFQzq+5YdZecG9aYDPEeIYZnbKOsLxBRPxWJJqmzkgtxyFm6Q7H6pgJfmT8h3Kuad19bA73vtpZwzVLTQFfciLkVTK9sOsCLeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773321259; c=relaxed/simple;
	bh=lADvAkdwzYDQIeDSMIDb24gKZEFFt8rTzV7oJZwvw7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mka2VIaW8L07AL4sFokJ7jEBsK+wjqplbIDRQvqPA5FL1ziaT8fuBOfeIgwyyhjgb7Mz+6UYpCbOXD1ztRan9fEgd/5HEmOMsOWiKpcELvOlcbczYzZawjWsoTwdjWhvJztRZ0cf9DbVuc/XdmEE+OhtwhgyKv4oScIxthV/YCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QFPRkdLR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ekJPip8U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QFPRkdLR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ekJPip8U"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C9FYSM3137274
	for <linux-clk@vger.kernel.org>; Thu, 12 Mar 2026 13:14:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aO1+YvVpUh8Bk7mDTuZcPxVY
	Iyr3Lp4OCqgImEJYixg=; b=QFPRkdLRXjxVvV3Fij4VSHlySdXb8txxh4lInEYv
	3T0uGjkTrRfzxbHKSrHaahpNrjxS3rmR5vmHjdC6T97OMZCv9+vo8c7EBxL4+HRu
	6nPNjtUNg9X93SMPC2uf9J8xy9glUR/C+We1ZuR53yPwe2i364IvdUzFDjIwkh1C
	atgZ7mLVwtOz9HsCykbE8eL26jlGgGHB/NayXKSs4Mz4uq27oeFIgnYLl0VMuI55
	jbd6u0NSzfANClWpMF7tgMQtQg58C2bLKuFW7rBqxszkwMJITX4I0Y6Zwqob53Vu
	K8vm6XJb23TemhwFunuEhWDmb7TgEpHqdeworih0h5MKNQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4wa6cm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 12 Mar 2026 13:14:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5091ee9f1d8so92513431cf.0
        for <linux-clk@vger.kernel.org>; Thu, 12 Mar 2026 06:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773321255; x=1773926055; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aO1+YvVpUh8Bk7mDTuZcPxVYIyr3Lp4OCqgImEJYixg=;
        b=ekJPip8UKdUHT4KNpuVtCWhNMaQ4tP+z6u4jv5iedgyalq+AgFiDZmwT2/y+0MnBlt
         w/x/7rUY/P0MiU8JPOoHPQCnA9lzQZv9Dw7saPC/mAFTjU1yRtp+v4LQduQDFiyV40HS
         U/KPSpUuPFmFkgy6I02De2qHLccWLs6lf6hiQO5RB7twpggR28enxN4cLt4+7fSypwCK
         7GpgG0qON5Yp2JgoautMoyZIobN9EqwuU2ep9r7ODfiU8D77IjbtUK/oqVmGunwKhn4D
         cx5W/nMbvYrCWPzwkryvUiNxjlYFX5/xZhzBDHUCQvBOQIXwcGXBM7oPgSmZ8wIE68YG
         pe6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773321255; x=1773926055;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aO1+YvVpUh8Bk7mDTuZcPxVYIyr3Lp4OCqgImEJYixg=;
        b=mHCimoUW2n28YY0CGAfiQbimxxgzdKgGXQHn/Bw5Pgv0hLI+ASmAwzeOixLQ67wZ88
         00C+6/4tCuBQauwAnTQZ3dBW6jWE3/Y2iZjqDizCRRIP3R/sxLjzLh7eeBTTTRI12Yp6
         71M7jeJANEUrUJbANi6zLhOFN9b61vOMxQGn8TjvQv3jo3JaSNjuEzZbc0qujG1CAMGe
         v506sH0CKPug9A1VbxSfsMoCwC/cCjTZa+f+BjG/oD5awhcswc72zQ582236nMcpQNFW
         ZvWzO8SinoiuF+IBJ2Vn7UssputhicK/rnQ1ak6S2loLxR1dG97CLwm/2eGUttS4GrQO
         RpTQ==
X-Forwarded-Encrypted: i=1; AJvYcCX859CvSw8TIXpq2ebB+bbHHcRgsparCV2QdmpFcKYtbehNg1YGjxJWPajlzkdVikVr5sbtHuGvvvw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzww7fxB0ROKxt0YxI8YST+SctC3ALeg07EJWertfCSDMLpPyyY
	iKBBH+0zfZ/eUsfW+cNUl8XLtDGqwvM6buu7VrJmtANSBIctluYmIgbVBpb8s9X3W5sM/O/bSv2
	XU9dJclnom3FSHK0Pi52Mu4jXG07ltvloOX6lkQY+MvfVdKjhJImZcsSALHuig24=
X-Gm-Gg: ATEYQzzCMC9GM3O4t6gAdEvCNQW7rRwFLJ18/VoyHDuXZ6p963elehuflFSILpvi4nY
	sjgB8qkXWxWnS7oykjdK7PnQIWIMfTSSTMHHSOIoQc9oZOKpFWdF0hjV7isDRWblqF2x9cbC3L5
	iWBefO33tH5rJTDtJ0M8+SD2VQimiUfKjULIl3JofCq2HcVVMah6kTZGiUwzIHvCf1ZkjmmKrb+
	nE4EkiaAcXVMGdcgbyKPFhwti8XDKsrtX6gk7I4Pw67QScjbM6Andpk688ReNYXpoeF3iK3j8m/
	YluB5KYaYwUH7Ux2LGdfaD4nH3RrfWGS/a0yq+HUGp5x4xMEcvJYOqjlxMQ0wjF5k45IvGIXcQD
	ownoLSTH3q+XRgz+ocskM2oquZMvJ24RlsX9mHKRwOXbbk1bGX7jvvJDaNvL/R5Lkb57AqntYJT
	+HRRKLFi7Pb0Ekwjk2BpNJJ+701Sim+GufMHI=
X-Received: by 2002:ac8:7e8d:0:b0:509:1cc9:8a4c with SMTP id d75a77b69052e-5094719fd6cmr42681161cf.9.1773321254589;
        Thu, 12 Mar 2026 06:14:14 -0700 (PDT)
X-Received: by 2002:ac8:7e8d:0:b0:509:1cc9:8a4c with SMTP id d75a77b69052e-5094719fd6cmr42680661cf.9.1773321254145;
        Thu, 12 Mar 2026 06:14:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156162feasm954937e87.55.2026.03.12.06.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 06:14:13 -0700 (PDT)
Date: Thu, 12 Mar 2026 15:14:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Jonathan Marek <jonathan@marek.ca>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 08/11] clk: qcom: dispcc-sm8250: Enable parents for
 pixel clocks
Message-ID: <vvwc6zu654wvphlsgjgzfjvkbkjlsnfz6nrdkunvuxcbmguu3l@nmor2xmbla5l>
References: <20260312112321.370983-1-val@packett.cool>
 <20260312112321.370983-9-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312112321.370983-9-val@packett.cool>
X-Proofpoint-ORIG-GUID: C9TrLIFcVpHa8Oeq3aENVrqMq0jieLAL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEwNSBTYWx0ZWRfX4Ep0vE7iekiz
 bmVWvyUuewb/KjNooXEPeBg+F22lf0S3ZrUEc25uesHxOicZOrXVh9RapGGauxAoJ8e97fMvn+Z
 Qm+mzLw5OG4/XankE3HyELLHz1Ig+Psr6qhVBpWLqzFFdZm0SEhAXaAjb/+l969bGL0lYkoXKCl
 YDP3YzB3mFEAgFQ3uOvJD0GLNnYqR7xZBbNUk9me48d/Jrpx11moC5mW9NDBN/jsGTWxjxMcPaC
 7p4XYjZQCP3QOUta5OziLQxOmHWFCF24XPQBKFHvhjiZdiQhPW1kp7LfRqHSaHyk1Av1xakLEdl
 Kfn/K/59CRrmuEED9S2mNia1FBnOedhGuU7wdRVEIgBs5NfHPiDwQOWVxddPHg3lCKhgRRjuogD
 13dys/9tSSeHuDhoVoAGd9OktfkakA724+dxJKCJDE/FD5DABwjh94GJQbeb0D8fV7f1Wa8zjm2
 6dtjZLo88eKNcz/xdMw==
X-Authority-Analysis: v=2.4 cv=YucChoYX c=1 sm=1 tr=0 ts=69b2bc27 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=r_lsR0YksWOz7yjZoXgA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: C9TrLIFcVpHa8Oeq3aENVrqMq0jieLAL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120105

On Thu, Mar 12, 2026 at 08:12:13AM -0300, Val Packett wrote:
> Add CLK_OPS_PARENT_ENABLE to MDSS pixel clock sources to ensure parent
> clocks are enabled during clock operations, preventing potential
> stability issues during display configuration.
> 
> Fixes: 80a18f4a8567 ("clk: qcom: Add display clock controller driver for SM8150 and SM8250")
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  drivers/clk/qcom/dispcc-sm8250.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
