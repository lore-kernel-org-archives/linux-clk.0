Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4582D7DEA
	for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 18:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763489003; cv=none; b=bEynR1MwLlubrX6uW1weu/BRRj8XYtD+5I8kq1vf3vC9MRS9I7bg2GF+sspil9p7U70qOIpekamhreVvC4BRjysjnYJagSQ/lRAQixGH5O0jYRd/SQYEAEbYQtF50LDQ8906FbCRzmWWvpKAjkPbYHIMLPWeb8dZYvOP91SIrsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763489003; c=relaxed/simple;
	bh=ZiwKdZT/b7+ZKy2Xh4g+YMNx7i8CqqIZ5SO+OHaO2tk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f87Gvnc9qR2NAcyVYB2PZ54KGEA7S6b1smqrEQGHVBoMudbtev21jZbrVVuTU5DM/G40ss7G6lHZJStCyXvZmKjFgnGQzlfQHvGi4hQJWOvutR1xR6rCz76CXKjo+ANXopEhjAt/PnBY67YVmEyqfTH8OshZQOSWXuoiUvCChlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HYU3XwiJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DiS8SFDe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HYU3XwiJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DiS8SFDe"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIFtXxu2194259
	for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 18:03:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=l+LFPdNUbdnChxjtlZMpFeBG
	dxNsKZ+vbm5ueraslPE=; b=HYU3XwiJwipEjwM8nwGRGl/0eemfWWqeaedX1iKf
	3aFG1MhaC5F7M1w2TXtlKwh8MpI6Z+PfXp59hD5x3bEeccs2KMbleyNnmPl3etn8
	7SZs8UnCcIVW0AjXsi+14AmAB94ixU3G5p1gRW+QKbZdjB6bK32AjlVyM3dmlQ+f
	AjQyVnMeac3lPvauYL6cfPqZlcbgumlcKceTlqxLQaM7YbcElRGRtdEpYvh5ZpuX
	RPOxx7GwcC3bQaiEX+QFmOzPLgUOeiMFmaLXPaTkBtDKpqpCQfOdLqnMA01Rcm92
	3wDvMqlZlvrHzrLF4OYnIsmQ+ugMUZAoeYqeA2h9A3PtNQ==
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agn3y9scr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 18:03:20 +0000 (GMT)
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-432fb58f876so141986465ab.1
        for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 10:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763489000; x=1764093800; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l+LFPdNUbdnChxjtlZMpFeBGdxNsKZ+vbm5ueraslPE=;
        b=DiS8SFDeR+TGnKfdR1OV6Dtuj3d+v6vfXZ0tmr0f9u+tqvjimblQQGJzp8SwZukJAS
         wLfW3ebTvq0ZcIySPXRYR9AZ/KQ0p36X4i9ik0HUwLQQQjRpb/49dU0EfptFn3agWNLi
         V2Wmyaz9LarSjx7pdqm7IisXhlbRxa5IyQSY2z5n2bSvjdSXjH9kSrcu0JmVL1Sa2pXN
         /yh6LRQnym/LjJQIBuSCKxk2CTT2gmL1h7T6izuevPOVWzJEgc+A+Yzud6QbmzDBLps9
         qfuFmI8VssHGwXBk0dE01vyaUKgUY5242SvWux3zp95ZmPAP3FFthXjR5uuwS3rfvhdS
         sMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763489000; x=1764093800;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l+LFPdNUbdnChxjtlZMpFeBGdxNsKZ+vbm5ueraslPE=;
        b=uLSUWL8SMzJhg9UqDygg7WeviUXbQGrlhr788Mt6YJzn1Vl6roaBPDdm5UGy3BsIMQ
         HRM+OFSznFliCX9fnS/IS6Sb5nSF2OPMZd6FHj2laY4icfgqEryx83h8Z1HWgc+jvH0h
         jqjuxoFtbXISPDXhWqIfOwaCF7fGjTStrSVCYSAdH3JN8SYwEKbwtliNDWmXOWHIXiH7
         uLH7rXy1WSsq89qwmw0GXu2QgzyY3t+JQOddXE4Fhcdvi2SMJJNkIEbn4ofwWpCuVxt3
         AP8zu1PSKPZ9YU0JY7OtlCvSrSbksjbD3q+SETm4sBiSED+8RwjdOh3+fmXI+Eg7KeQa
         p7fA==
X-Forwarded-Encrypted: i=1; AJvYcCV6J6HTOyptcQw+XJF6aOV1Ge+uGb7NGNjDfgXmpeKhA23FWOqTrP6a76VIhWlCBh2vQG3URSl1bwM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZlZgj2rdTpdPx7JOG1Ywyjv2EgEnzmagjETrwWQ3uUyas0tgY
	2Iu2b99+soUNHEqND24IEjpcX7CfAndYHiaeQQ/cXAAQ4stNoX6RhJoK47tyTJwTngMLzpwToWF
	QXZ/yfqc6ia4CsEUQB5/1kLKk4ffYBOrlJnbsUGdccaL4nURCNlqzXh7L1Wd5xeE=
X-Gm-Gg: ASbGncsvrVwT1lhY+zcfP7PTbHL/YNn94etLgTZ27Fb4uL2LwrrK/0pP206KdrwdtFa
	LjFAY0E07nObt9ObqIXqO4H4rnzF1l7HrbQPs0VngUIdCRwown6Q3vTNlIOIXd0wnkal7xb6Dq1
	xXgF7RruAXUEFCpUjPiekDH4O1BQyuCh6uQUNsJGl3QKUcBJbCpHlsIUCORL4D8Xs8sEnalMvY0
	XoBvL/ut8EafYEsRlfix8g7sbxENhaFk/bBbOjHg/r/F3acojaVe4zuKW1WX6/N4QG95ytm8QqI
	CYPRciK25vy42vzMsIUo/o+Cw3vloOK9LXbJUeSYVWUUkm9oXc5nU64rq20SNxRJV/lmoCX+Pdv
	/w4LQ+22kok26BO1Gda0jEa//PDgWuNzEtHBcWXA5FSMqZWuNA9H/xSpHjMFT6e64meKQT25xP+
	iZrHjoPQ46v1wk
X-Received: by 2002:a92:c24c:0:b0:433:3564:66a5 with SMTP id e9e14a558f8ab-4348c8ece4amr218286605ab.14.1763488999659;
        Tue, 18 Nov 2025 10:03:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHDGe4BtQOcG6Rfn9KhKjf3bfHRFxwHEFjJMkWf2eeVTSBud3LSJ9z9RFhwWMfdRM6Xxc4W2Q==
X-Received: by 2002:a92:c24c:0:b0:433:3564:66a5 with SMTP id e9e14a558f8ab-4348c8ece4amr218286215ab.14.1763488999129;
        Tue, 18 Nov 2025 10:03:19 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595804003e4sm4137514e87.67.2025.11.18.10.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 10:03:17 -0800 (PST)
Date: Tue, 18 Nov 2025 20:03:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, usb4-upstream@oss.qualcomm.com,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] clk: qcom: x1e80100-dispcc: Add USB4 router link
 resets
Message-ID: <zqvvlxogscu3vyr25fdwq55ekbs4icrnvbef3p2isvrvppgubx@xxwhmwov3sj7>
References: <20251118-topic-usb4_x1e_dispcc-v1-0-14c68d842c71@oss.qualcomm.com>
 <20251118-topic-usb4_x1e_dispcc-v1-2-14c68d842c71@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118-topic-usb4_x1e_dispcc-v1-2-14c68d842c71@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDE0NSBTYWx0ZWRfX8067BaPZmwBu
 8v4G+r5N/CYGWDG+dGxa4uZatSCKrx6zLWBff1qCaKZb1/VIEqgvf5yuOA4c0oTzp633rDZpdoo
 /TI/zSP4/xW7cf6S8O1gyhgbvNwZdeA5HhjqiFbQZmbMtO2IITXSbpH7Y+hk3FjfDGXUqHWk/hu
 wvqieJKPtMZaQIEdDTbNkc4qob2ZlMHVi4x2VQDCTmchTIb8aMuq5fzdfSj8Olx8ko512BbUbuK
 7hwiy5iMn0v7uG1VjDUMOgI8S7/3e7u/Ao3XhziBsTXxO4xS4oqP4CbnuY/ylRiDdN8lpydmlyI
 2dL5biH2VkgE3HqJa3zSXMeP55ibshaht5KN8l5G0+QavPt/o3cofBIec3OiRXQaoBbr7bLS4Zv
 bxIfh7pzSs62118rBlaJqLFC4TYK7w==
X-Proofpoint-GUID: KSpZkuZIXDiwDlDzsgIrGk6ruPkIeIPN
X-Proofpoint-ORIG-GUID: KSpZkuZIXDiwDlDzsgIrGk6ruPkIeIPN
X-Authority-Analysis: v=2.4 cv=FtIIPmrq c=1 sm=1 tr=0 ts=691cb4e8 cx=c_pps
 a=i7ujPs/ZFudY1OxzqguLDw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=-UlXLyfOqKNP4VhGNNUA:9 a=CjuIK1q_8ugA:10
 a=Ti5FldxQo0BAkOmdeC3H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1011 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180145

On Tue, Nov 18, 2025 at 06:33:12PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The router link clock branches also feature some reset logic, which is
> required to properly power sequence the hardware for DP tunneling over
> USB4.
> 
> Describe these missing resets.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/dispcc-x1e80100.c | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
