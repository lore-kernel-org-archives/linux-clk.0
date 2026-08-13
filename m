Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F11431E6B
	for <linux-clk@vger.kernel.org>; Thu, 13 Aug 2026 06:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786604134; cv=none; b=UfwzQdSiYAHRiAbtvyb8abXB7laYWrbUtQK5cxuLHUeVkvYDyENEfAdCdpnDN1b5R+R+kENsQrJjB2Zb0ij5qLI6cKPlVzWreRg8MFstmaBX7Jnu4zJiqU2UFblHE8djdhuxRnoEBC/7/0tfaE9ZmEo7NsgUMhYMUA5TpfCgU/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786604134; c=relaxed/simple;
	bh=FyrXSyJlsKW1PEWcevNBLrlSX93u4IVPdkyJXqxrekw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Os4gQNcwcLyCSm9YPOXZuMIk0h5uifCtZst9oM62akjg1U++Ahl8Twcpli+gipYXhq8cgtIztsf390hfPjEaUMZUcAegHR75XwyEoMwDuaWMkx19AbSwr9anOWEZSIrcqhWkaiAcwJHZqKCK5nHwmE7ZlhrCId5Ttpx0k/3JYCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jJsd/OJJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CNR2WgpM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jJsd/OJJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CNR2WgpM"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67D5gW9u1749868
	for <linux-clk@vger.kernel.org>; Thu, 13 Aug 2026 06:55:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=z1oMtJz6T8xpPC+oiX/DPiDd
	RJnDulOaB3iaduLIdyA=; b=jJsd/OJJ8HDvczOUOuglGT47NRWoKoOj9h+uriVL
	ke1H9RGhLhap+pm/fAB8qh7Nba1/HF/xJxPxWKHMJbC3LBDLo1AJMgfg7VJPi5gu
	ixYlZxPI7MUG384n/oJq4UOtU3SWUpx6Cw0CE8OvNNN8/nRAZRcB559FMcly74UW
	vibyvzQRYe3rVSPkDd+s4HLiRpOVt5rb2Dc2PliRrW8mDSGQP3RJIvLxMtqNMZio
	xtkHnhdurmiw/+vxGY0g6bBDS6Acu2KSNPkJVYjFG3shHoRrl5+AqFi5iyZWh9p+
	kwReTJU97RsXE6J58CiD8tFuIXfo6DYLJ7RGx75Dh16HcA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0xx1t7gg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 13 Aug 2026 06:55:29 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8487eb67173so2862664b3a.2
        for <linux-clk@vger.kernel.org>; Wed, 12 Aug 2026 23:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786604129; x=1787208929; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z1oMtJz6T8xpPC+oiX/DPiDdRJnDulOaB3iaduLIdyA=;
        b=CNR2WgpMEBJhz8cJLWYEXEzjsamFWqnkGz7JF3Ch+UGVOsVuF4s5pEwFHPjX0N92x7
         I+jbwjPOTCBSzvCcQ0i3I6SDV/rzcrmdfKadHArf+HfWwXY8HvMuetHm5RlOKMNpizGY
         gbTgnM7jeU43ON/x9T6RrM+oh26zGcwiyo2KfTnB+vCvzwG5hAmyYQFQvNJX1lz9Ts/9
         6WXZ0w2mRsLNMjlXYDWZEopBiOL7GxF28VdgWYFk7ntUCCAEBNzt+nIkjCcjR1h5xr/9
         2YXiScoW+WGkGvjrNh3rOll7TKkgJBdSqm9/8LmH3rV5ChkO9QhZQ9BMsYR7NN2OkR7Q
         pejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786604129; x=1787208929;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z1oMtJz6T8xpPC+oiX/DPiDdRJnDulOaB3iaduLIdyA=;
        b=lfeBmZsw6xHiZL+V8YmtDvhut4kVwT5wnJVK8SlWZkB2ucb4kGVA6IUDaOJCbc1yrO
         j+pY21VoQhbGyw3/UTepdqxeqWlnNiA6zPD/hVb0aOdyYi9fxZs7ZNXcpl4ltsRsNxqa
         o3YSZCBA+2/5l8pwTF0B66C4nVTK5mEa+fJI/YQ5UNE5hS1Bn8G8/ZsoaqUTlJx23cXy
         thlSKtvI/GPLTdlkhZpoN8fBpRFGMh/7FrOgxLHl8HWwZY12n0xltd5rmHzbluyDMcdE
         oJtDloIqYMYvQOt5Rhv4Ucz8uQ0bIU9H+FgdB7q/slgM4itKNtEVj0OKEHutKrJCimVS
         dWuA==
X-Forwarded-Encrypted: i=1; AHgh+RpL9NxRvCETgDOgQLBsNthTMie0P9wT9kyRqIFS5R0lpMJRKVv3og0MdRLHAWqpWP2HA1MifD/irOc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKYANSy/NJxXqdv7pRmEi1ME7XPdBNHwxM9aurxrUTKDE7ehCO
	szjY4aIeF4qdAvUSmsw6qBBOono3Jlq3sqpj96tL3hVmpjnSKqkdVH7K+aXlTpVOHhXuFObOCfO
	qL2zAn+fTt+U7BkGqNERVbTbF7Itef5b4lAL3iIZUlk3eT7H9m2GKsamHnna+pRU=
X-Gm-Gg: AR+sD12SyqP9yxDRai8YRgGYLEsu60wsavMP7LlYKjhgYg4x0h4BF9c8hsOG06544Ya
	TEwmN0FFRmv+bIQBasRqymXZSyKL6FVvIkIqLTi4S+9Gmr1b1fh4dEchOqGXeJX1vVKJHK/qth+
	zgZSG/Xi43L1500MRolgCPqI15SMeZLGe2lhM0kkoT98fjx7L1r/Z48DhpXoqLSIt0T0+aKFW7x
	EpVSuh2v3Vx/w2qrihqSLOmAzDUk6uzKoF8/N61wNX1atisMxBwQ/5wT3o+muH9e6Ea32zHgCu3
	z8N10nN445S4whRBwey9l4JNgCDERk/O2zOjxB+p3r7t2Z1vJGLTqScAT11pKgTsX8kdrtDn2+0
	0LGwylNy/tPjaakINZM7I2TusqgU0d9vARZ/zjo5SNHB+SeY=
X-Received: by 2002:a05:6a00:23cc:b0:848:2e7e:353a with SMTP id d2e1a72fcca58-84fc6c3fff0mr3503182b3a.0.1786604128810;
        Wed, 12 Aug 2026 23:55:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:23cc:b0:848:2e7e:353a with SMTP id d2e1a72fcca58-84fc6c3fff0mr3503125b3a.0.1786604128277;
        Wed, 12 Aug 2026 23:55:28 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fc4781978sm439476b3a.20.2026.08.12.23.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 23:55:27 -0700 (PDT)
Date: Wed, 12 Aug 2026 23:55:25 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: qcom: Move x1e80100 TCSR to
 own binding
Message-ID: <an1qXeZoTdzrXqVx@hu-qianyu-lv.qualcomm.com>
References: <20260812-hamoa_tcsr_qref_0812-v3-0-dc7627169c6d@oss.qualcomm.com>
 <20260812-hamoa_tcsr_qref_0812-v3-1-dc7627169c6d@oss.qualcomm.com>
 <20260812-lively-determined-loon-31f65e@quoll>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812-lively-determined-loon-31f65e@quoll>
X-Proofpoint-GUID: Kd6anrhhCHvV5z9NQW_Sp4h90-o3CoMZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDA0NiBTYWx0ZWRfX/S0wVVWfdWYO
 VC/lh6HIVcZjUZGsYzJk5c5bKFVMO8qLYdsUEc4u6BhKolM5RKuoH/6j0+E6U0kZ1fzijVQtLjY
 zFbNbwEWqtIf4GwQQEwY7GsACmZedivx5yThdSsz4Fm/RuX32xBE1KgXljv55Wtv7kqokiqk3H0
 9YlGC7mwTKD6ZVRwRdPZK+3RAWLX/VqWgzQNEp4/7ahCr1l14wpb8PhNJgtVEPw8OaYq7fZmyCE
 MAPDS083syZ7Are5PQF0jUn2Ux//gY6aL4OiRwkplVDVQ2D/Cca0K8nezW4s9UqfdfhQp1wKWql
 3x0WWc2k181Iv0w3fInqd5lF7VBf/+fYWVS5DOMTlrJCkoRSUqICJfsxQ7bb5EE6QOx7dqLlSQF
 8kCpcTTLy/fT0aZAsb4Z8fIXJ7AmsEV5huHHXwXtc+SvLVghKeCK1mLuzrAvj9jm3vQUpA80yIC
 T/tIRxEAqNV6ix1a5BA==
X-Authority-Analysis: v=2.4 cv=J6KaKgnS c=1 sm=1 tr=0 ts=6a7d6a61 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=PqT1ZXtJkh0dzeW4At4A:9 a=CjuIK1q_8ugA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDA0NiBTYWx0ZWRfX7zPrDLq5F1bC
 NSWerkSTsM8JfNw6kYWOqJjKJoG+edl90P+R2cizzEK8ym1MfSi0zXdEcwhIUATYqjTVUP61Zew
 Q2lVPMwU0mu4JPRKY0TQclH4X3mlalM=
X-Proofpoint-ORIG-GUID: Kd6anrhhCHvV5z9NQW_Sp4h90-o3CoMZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130046

On Wed, Aug 12, 2026 at 01:20:39PM +0200, Krzysztof Kozlowski wrote:
> On Wed, Aug 12, 2026 at 12:27:31AM -0700, Qiang Yu wrote:
> > +  clocks:
> > +    items:
> > +      - description: TCXO pad clock
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  '#clock-cells':
> > +    const: 1
> > +
> > +  '#reset-cells':
> > +    const: 1
> > +
> > +  vdda-qrefrpt0-0p9-supply: true
> > +  vdda-qrefrpt1-0p9-supply: true
> > +  vdda-qrefrpt2-0p9-supply: true
> > +  vdda-qrefrpt3-0p9-supply: true
> > +  vdda-qrefrpt4-0p9-supply: true
> > +  vdda-qrefrx0-0p9-supply: true
> > +  vdda-qrefrx1-0p9-supply: true
> > +  vdda-qrefrx2-0p9-supply: true
> > +  vdda-qrefrx3-0p9-supply: true
> > +  vdda-qrefrx4-0p9-supply: true
> > +  vdda-qreftx0-0p9-supply: true
> > +  vdda-qreftx0-1p2-supply: true
> > +  vdda-qreftx1-0p9-supply: true
> > +  vdda-qreftx1-1p2-supply: true
> > +  vdda-refgen0-0p9-supply: true
> > +  vdda-refgen0-1p2-supply: true
> > +  vdda-refgen2-0p9-supply: true
> > +  vdda-refgen2-1p2-supply: true
> > +
> > +required:
> > +  - compatible
> > +  - clocks
> > +  - '#clock-cells'
> > +  - '#reset-cells'
> 
> This is unexplained ABI change. When you are asked, you need to address
> feedback from LLM, not blindly implement it without checking its
> validity.
>
After adding these two properties to the required list, I ran a dtb
check and saw no related errors or warnings. But I overlooked one
thing: my dtb check was against the current tree only. This change
could make dtb checks fail for historical TCSR DT nodes that did not
have these two properties. So to be safe, I don't think they should be
added to the required list.

- Qiang Yu
