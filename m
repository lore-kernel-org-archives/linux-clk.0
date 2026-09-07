Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44F1382F1C
	for <linux-clk@vger.kernel.org>; Mon,  7 Sep 2026 05:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788758461; cv=none; b=CYbEMjN2tDu9laEZyGle4B2/hFVVBGQuFmu61/J7LAqbeyH596w5orLm7zb954/6npNTQe5ro/fXWxowweCfVLrEPtcIIdeJQq2r+a9989KiR5XN1SUIUNR94G/EKJF14BEfpWIhBNlyMRui6UPQo4CyZZvLL5WpE7GDteMBrdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788758461; c=relaxed/simple;
	bh=9BNICUCjnYuSs2tIQEnmzXWtbxa30Ttn26Pcsn6RMNY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rF/XlZYJ60Zs6mLt2smA+2pgcy4sybUfWXFWCnSQ/uRBjpAMKk9grDhdX0JCkxavPyeltYKOWIxeipOAgX7TLRIVILaSdzSaecWQKFN5Eulck8b3yoK+E5dIDaxUemokeQhIxofJGhYroZAOVaISfsX+Rdb/uPv7tbFDUMqHzGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GqZ7lyQE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O905xH1Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GqZ7lyQE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O905xH1Y"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6873l12R2276446
	for <linux-clk@vger.kernel.org>; Mon, 7 Sep 2026 05:20:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EQi0m10Vw7Hsn/l3jeRYM6TgeGL2nUNqyr7d+OOIegI=; b=GqZ7lyQEHkFMRo4O
	TkDdpR++EibuNdfmpDeaiHQIwrStHnX8y0zG/yR5L/bS9Y5Enawz6Ru6Gs9c2EtE
	hGRBNGv/0Rzr68woDMjuS93uhWa9kwG7Q1kHoOtu12ZIVJfZPL2KqcSrDyAXDlym
	KGEhMXF4YaQ6o++Z7QRwjrubgwJDRHGwbaAAdrhiZ3QrKh38GlwtUvViDfxFo38c
	eDf56HNSUDkhlEfpNon1FBGu6n44VODXg7Cd0XPPZxy/wN1wIywl7Stlzx4MH4Yy
	hSPLcqKVo/fLnubbjWTEjfBUkc6GVTb4rcuDVvhdcfcV2vjzg1wFANXxR5vaLanG
	8BC5YA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghfxkrw1k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 07 Sep 2026 05:20:58 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8627258ef12so5088975b3a.2
        for <linux-clk@vger.kernel.org>; Sun, 06 Sep 2026 22:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788758458; x=1789363258; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EQi0m10Vw7Hsn/l3jeRYM6TgeGL2nUNqyr7d+OOIegI=;
        b=O905xH1YbDQl/ifLN1QANKLTSxr5zXPDNSxws7U4HEFBeuBD8hyqtcrmrev6nQsFV8
         63/D5WMS9FV6/8v3ducrJ/7e1qQ9UCB9Ezb6GYyYxeOQpUZCWEH1/Jixe4VoSkr+Zxyi
         mqPfnL4MUPbfYdo8mSJ6OP0sjRmKFBhD7/CndeepMCiQ94JxeftIqI6tnxIxVlrElW18
         D58iVe5MB1Do8uIsU1ZGpk1fuW4GJpSGB/JtSIYLaiKoZuml+RoHLXQW/opx/7ORUOLE
         2Q0oDCadWd5ATchgE8VgznL27NHzt0OOv3cGbYbQm/8g9cqWpNmWTG29MgYwBzfIPG/6
         4Plg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788758458; x=1789363258;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EQi0m10Vw7Hsn/l3jeRYM6TgeGL2nUNqyr7d+OOIegI=;
        b=e5pIEezIYq3ppUng+xT7Bi0nFMhb821h5kH+AaZdM6FY9L99CdCcBuzVGitvcNCbvF
         EH7Lvy0chETdyc+KkN6YB7c/c9fSwtC3aCECyp1DjnO3DMTukiAZP4UxsPZ2sDJnrz1P
         jpmxrwPzvd3qMHy8D09LsrkubPHKOFTlHJVUfxGt6NwkH3Z8a2Qbvv8p6rbOMW0lJQ93
         o/zgHo7YqdBRCxrUnTHrAwsg8IynH0zh9MgXXs0N753jGSVzsw1pVjDXJ7c85cC2eY8G
         RrUfpTlOSEaESAgf6cYOkU0QDM98HjQTWhdChL7QJCwA6Z1NC9qci7wWoQD74EsOYCDC
         Ljyw==
X-Forwarded-Encrypted: i=1; AKwUvBzxeOKkXXaNOnmUDS90oquPoXMPIIWXd27oGKOWV9nFrkwKc9WFIt1OmX2YFYVo0MMdICzMGhKcOc0=@vger.kernel.org
X-Gm-Message-State: AFuF++mNE2LbxhIKW7WogInVdIfpN8jWqYxQPTR6dUTJFKu/JtXmMYSF
	WcKo1RC2fGaCn6Q2LjTUteQa7jnZGDxjjcDkvLAY/8iitbh/jiuLfwPmVsgGo5XFBUNxXFuv1LA
	6EhPs7Bn1o+FW1jfXUVNmzhPyY4Vex0wKa2shgT9YJ8XjiMzzfLGJgx2WL8hwMC8=
X-Gm-Gg: AYBFou2sz0FeLUTDEWYjGMNJuhgkwXYa+5cBfeWuP6XQPY+f4GemsA9BdIsMkw+z6px
	XVTUsDlWcQb0l2ynsZzlh7S18BUWhveeoat8vz85fV2EA8N79r/vk3DcSDI6PTCJs6KSeamiHHj
	WxY2RcEm2IBh2zO8cZfA/UBMN81RW1Dfc0yRGmW9XkSHYlMc4YkC4xjvSDofRlAmVmpWxzunGoR
	tgx8c1Elz4ce2XOKp/ty2Qx0HNIELwhMC6sldxBUsMR/nsnbEevwKQ8JkuXS5HVQb2/6tzzRIP+
	+48Bb15TQz2gZxRFPAr1t4OT+mvxbbo0O9Qime1Qvoovje75oJNZHDGFmORppQU4GRwOTYeGkuJ
	VFDrNl8+R5FXo5StupRWSQNZ1JhvKDim2H/YU+CbFG5Z0uA6f6rBK/czsdNQfOmHN
X-Received: by 2002:a05:6a00:9a9:b0:857:726d:270e with SMTP id d2e1a72fcca58-8616dd533a7mr29855195b3a.26.1788758457562;
        Sun, 06 Sep 2026 22:20:57 -0700 (PDT)
X-Received: by 2002:a05:6a00:9a9:b0:857:726d:270e with SMTP id d2e1a72fcca58-8616dd533a7mr29855135b3a.26.1788758457058;
        Sun, 06 Sep 2026 22:20:57 -0700 (PDT)
Received: from [10.133.33.39] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86278118b7dsm2821348b3a.28.2026.09.06.22.20.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Sep 2026 22:20:56 -0700 (PDT)
Message-ID: <8df9e586-d504-434c-a14a-a4553adf535c@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 13:20:52 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: ipq-cmn-pll: Assign .num before accessing .hws
To: Aamir Ahmed <elb12345@hotmail.co.uk>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>,
        linux-hardening@vger.kernel.org, stable@vger.kernel.org
References: <AS8P251MB0001B905088748016A0965F1C8B42@AS8P251MB0001.EURP251.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <AS8P251MB0001B905088748016A0965F1C8B42@AS8P251MB0001.EURP251.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA1NCBTYWx0ZWRfXyn/9RbsdUw1D
 B7bBXpWtLpd8zNbvwvXB6OZJ+XEkihIVYtgkYcC1NeA4z2vI/Cw/UGpfvlvxAjwhf3dMGSCYymj
 +Nf2xK/A77tjbfJa6o7mBM0LIye0qcw0baQgIWtUKxmLh/22KJ6/aLI1i3YptexLRs04x/YdzwV
 fuLaTiNutEGWMvv1+ij9WIxkCKYT/z+HKkioQbHUYRcafGGXfvvsQoWjEXDCAolWANZX6EiFDF9
 LKp7wRqPdqt7zuajOoAbWnaEDHImjfcTBSaULMOC5tEGJofZe1+A048nJb+rf7OtyzECI84jFQ3
 SfmNIkscx4rFwUG42lTb+MLyLd+v4PKWo4jI7hizetVLuJVyChThixtrsloACYhvxBF/2qyfW8O
 LCZYhSH1LalvtWTlVSd4Ip4+ItocgTnwOODrHcKuyYe86WTGgPJw/kgWHXT54szXX81a3m1O/Rx
 az3U/Kg9zVmB5n0ix4A==
X-Proofpoint-GUID: YEsE7KnFjm53o53ciiEpFcjI849mYSD6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA1NCBTYWx0ZWRfXz5rW6Q5POeiN
 XHNLmnXFSPxYpFE7AgfuLTaik4uFmWBUGVV91vxvUGF0vX0HMMoeeOAiAkSxots1q1zR6ykq+Lb
 6KdjQfn2iQmoiQ5wEiI9KUKYxLg3qNc=
X-Authority-Analysis: v=2.4 cv=daOwG3Xe c=1 sm=1 tr=0 ts=6a9e49ba cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=hpht91bhI_x_d6pdDbkA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: YEsE7KnFjm53o53ciiEpFcjI849mYSD6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070054



On 9/6/2026 4:48 AM, Aamir Ahmed wrote:
> Commit f316cdff8d67 ("clk: Annotate struct clk_hw_onecell_data with
> __counted_by") annotated the hws member of 'struct clk_hw_onecell_data'
> with __counted_by, which informs the bounds sanitizer (UBSAN_BOUNDS)
> about the number of elements in .hws[], so that it can warn when .hws[]
> is accessed out of bounds. As noted in that change, the __counted_by
> member must be initialized with the number of elements before the first
> array access happens, otherwise there will be a warning from each access
> prior to the initialization because the number of elements is zero.
> This occurs in ipq_cmn_pll_register_clks() due to .num being assigned
> only after the fixed rate output clocks and the CMN PLL clock have been
> stored in .hws[]. If registering one of the fixed rate clocks fails, the
> unwind loop under unregister_fixed_clk reads .hws[] while .num is still
> zero as well. With CONFIG_UBSAN_BOUNDS and a compiler that implements
> __counted_by (GCC 15.1+ or Clang 20.1+), this triggers an
> array-index-out-of-bounds report during probe, and with
> CONFIG_UBSAN_TRAP the first store traps so the CMN PLL clocks are never
> provided.
> 
> Move the .num initialization to right after the allocation.

Thanks for the change.

Reviewed-by: Luo Jie <jie.luo@oss.qualcomm.com>
