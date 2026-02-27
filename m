Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE131155326
	for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 00:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772150848; cv=none; b=qxjf32p4jZvUJSXSrsiZ+IH1m1M5y1O06/u25Hg76ce+07UP9Pt1uwo+lMMOw4QauSt5e505LuKFLgswW/h/OrQW6o4Bjsf8MQlDRX2kVtp4WvaMz12tYqEVqEeNUGGpYEDUtTPgGWtXr6x0NBva6lW6+uUvBxIXTmCgadjYSzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772150848; c=relaxed/simple;
	bh=wNGfels2kdrhktRD6V1h6qL1cc8PzEi9bY9hroCZP0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R+RkWOVTglg6QYbxf5j9TiMQ0qjuFTwEq6/8N/cyHZhsrtPIVvH1TUdMOgzXYFQJSHmQJqgA2Vyrs9l6t4x9e8V1WGxT9MN9vsgM4NFC9ikPIBOydtJEmni2VZhMmkIU6q3MyETeWZbP/DtFp9jzm+wPNf6++WJQrfPQG5+WWHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iSl6IT1D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KDAMQGCs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iSl6IT1D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KDAMQGCs"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QMbBlt1948554
	for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 00:07:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+bVor6LYXfxmtccDaQIOzpfZ
	axn9rQCZgEET9kVlVfg=; b=iSl6IT1DxDa7HrPovkii6j2g31ivVBdr0dYVq4Kv
	Zh0GAIBJo+tL2UFrqAhRlSRXQE9ai5fyMARTUnm9t1pXo16vwLgEpzJplSdlMOK9
	PotLbMDZD9IyjcfEdulZY/GVjKQlN5Sc4yXscu9dPzOeIzBt/86dKLZycFk+RH1f
	bDzPUlGs/R6iQILNfZk492XHCDAQrJSXw1Og8d6p+h5O8MuXHTlz6Pt05jVKHli5
	pI2O42kQXOEhmikSZc/BNMHUijXWUN5f6uz4hDY6g83k7X+bp7/6dNwF4aErG+Qc
	w4OXaW5L43gWiheoUXq+/oVSMh2z+5TC/L3/oyAgCGnxJg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjc0gccrk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 00:07:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70e610242so1165521885a.2
        for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 16:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772150846; x=1772755646; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+bVor6LYXfxmtccDaQIOzpfZaxn9rQCZgEET9kVlVfg=;
        b=KDAMQGCsCUOtHR4ppQJqVAk7Jy9Fw7yBQj/sRmAcA3tRZdVbNHjkjRYw2M8tgoX0Mf
         UYbMqO8atGgvfbg25b7OBGRJhDGkoFNanjWuoUM5zLx35n2ZU1Sha0DKaIWHVncQp2P0
         Wzy2SwKFCEnHHIRHS3EzhcLmsWB+rkgHjoxMwxC2gPeyY69wD45sRSPaBWFe7FTvMrFU
         orRXAap+zVJCR67yasNCmCV6MCfhWxFAAJkqqzOu9kbs3J8N6n6PdzbiBgNU6nxapJOZ
         9D7IsmG+ZkdQ924QHwjr677HN15oJM2XtaUbMb1Odb1OOeGcBl87KLbu5jct+DdVmD9g
         3GkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772150846; x=1772755646;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+bVor6LYXfxmtccDaQIOzpfZaxn9rQCZgEET9kVlVfg=;
        b=h6BFLIykU0zm6waiF+cUo54u/9eXxF0pt7/RzXsBPvF9I0d8CIzzXtUm7oeK5Ggdw/
         Xq5UxNphV58V9znpGBcv3/xznXqP6bM1R02P7Q2RRvlBQ0GKBe3IzsXIPoXlnSHdOxJX
         xyLHz+esCwyI5L3V4z2hQgt0imm4fIbVQG6eTUKcO4lcAw1qv+aFVvhQp//FbOvcRIdz
         HNssXfBCBvHgwsNlC//KYw1ku5K2VNdHteCc0dQ/ljNYnbdodfJGiq4HKEK7nSG61PQG
         vsTsq5/XN4b6BXYjqG2kP58EwlBbRujKWUnEbEECLrPrUlxBz2Gg9PeO8VNfyDisPzOL
         gn9w==
X-Forwarded-Encrypted: i=1; AJvYcCV0JeArnepxVPSo1lUA90ApiBHcfB+gCKnkIh6ZnUGBVi4AiM1kInUtZZsZZsTp++ENpBp+0qrOFjc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDF9BQHsrZm1j7nIz2QSQzfGQ7+JcTsrYfmcESFnURA6veCKnd
	84WYosR0DgRzrF21YZw5NqxJBhlKj1o4DetIKtCzZJoYyW3U13msZyOhrVrIlAl0Qf1zcLgTyqT
	tEsAI96yQGVWq+lotliXOAW2yJ400/moMTopwFm5OTORoOYiXZDRwOGJno5q9jic=
X-Gm-Gg: ATEYQzyTpcTmsqv7v3E+7zTzZYBKVziQdgsHvuylpeDe4VVAYM4CuyyTO6mcukdk8Xe
	sIVMJOP63wULIszObrGIp9fv6K7baGXRBG/gz78z9JL4kDXuuiPpD56WLCRcy44zizGRQTPiGyy
	l9sP9FvxYqhkQa2TCOpLgKFaNipv/+fzcg2J1RjvuksYmvh9tEmz5cbpgsz9KCxMvn+vjCk6ajx
	VlkCBK06ewAA9ik6Itj9jAphAVE3I6f2kKgzjIkyZ9ZQjXh3+HVKqtRyJ7aUTBBi7mX1/mhjvIK
	Hf4gAQo+yWmDq+5kjctB1PoJRsj1jZ9X1smk7eYk35XQDQwXQg1Jv0HXJoLCt05RI191uSLRH8f
	42JuUmNh3RFt6fc78ttF1fwe8zTzxVr3YHFYIL/vlM4M3gfkNuHREuChRmgLNIwi7Aehice+tl7
	ygV0FejMG5jRaYd1VwnD8P/GKNKRYAuA+xzGk=
X-Received: by 2002:a05:620a:2846:b0:8b5:9fc7:812b with SMTP id af79cd13be357-8cbc8d834e4mr114775985a.6.1772150845902;
        Thu, 26 Feb 2026 16:07:25 -0800 (PST)
X-Received: by 2002:a05:620a:2846:b0:8b5:9fc7:812b with SMTP id af79cd13be357-8cbc8d834e4mr114772485a.6.1772150845384;
        Thu, 26 Feb 2026 16:07:25 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f3016de6sm10754071fa.38.2026.02.26.16.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 16:07:23 -0800 (PST)
Date: Fri, 27 Feb 2026 02:07:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 08/13] clk: qcom: rpm: drop determine_rate op and use
 CLK_ROUNDING_FW_MANAGED flag
Message-ID: <zoyg5vpedt73nwqgihbovykybfvimvfgefa7zllponjlx45js7@hdmahvx26y4u>
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
 <20260226-clk-det-rate-fw-managed-v1-8-4421dd2f6dc6@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226-clk-det-rate-fw-managed-v1-8-4421dd2f6dc6@redhat.com>
X-Authority-Analysis: v=2.4 cv=XI49iAhE c=1 sm=1 tr=0 ts=69a0e03f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=20KFwNOVAAAA:8
 a=VwQbUJbxAAAA:8 a=IpJZQVW2AAAA:8 a=EUspDBNiAAAA:8 a=1r2m-iIbPs-O4eL_W2EA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDIyMSBTYWx0ZWRfX1wTOOvP5wkoW
 a48qnbIBp15QwkT0zEAbF6CpJHaJkbjXNxvJBxFb1OGGDYI4H7HsYJYryHBln6cO4bnlyiFOHjU
 SKxROj1ypYy2LIAihLzkubYuXCBmNIcRJwCzJwMrFlcoxL7x55sRKc/wn5do1pVms5s588WJ5JU
 ziz6r/5zf/AaelTmZZI1QJ/V5MSf6ls4ZhW7jVoEX8Z7skRQOfxz3XzKWUZ66ZmSPSfNjWGaw5Z
 TMUudJXKd48G+wSyyCfYdANXEq5PB/+7VIwKeli6I0+I416CRqHVZGRLTYYNx6DD8POx6wrPyRK
 UOgnRFjZJelIa7xjHm8crRvNMpUMIvIL58ctqgTAhsmx1hi68u13GGLrKqoE7/ff46CnAhDi4UY
 M3t64ii776puZ81UzuPqUk+lLB3kflKCwH7z/wl7odqbgRc7sIItkqFN7INWwmnUcbnLwpedJ/n
 DVlh32ymFcRZeCXxB0g==
X-Proofpoint-ORIG-GUID: A6vSKMMi-LC2S_UEVNc3W20ppJCe9_2_
X-Proofpoint-GUID: A6vSKMMi-LC2S_UEVNc3W20ppJCe9_2_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_03,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260221

On Thu, Feb 26, 2026 at 01:16:52PM -0500, Brian Masney wrote:
> This clk driver has a noop determine_rate clk op. Drop this empty
> function, and enable the CLK_ROUNDING_FW_MANAGED flag.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> 
> ---
> To: Bjorn Andersson <andersson@kernel.org>
> To: Michael Turquette <mturquette@baylibre.com>
> To: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/clk/qcom/clk-rpm.c | 16 +++-------------
>  1 file changed, 3 insertions(+), 13 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
