Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6A640D591
	for <linux-clk@vger.kernel.org>; Thu, 11 Jun 2026 09:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781170904; cv=none; b=k5+UuXenc17/nd/PAZC0IDOSppd6Iuxp+exYU9EgT6TX+T1Zt2Mqm/OgXDgwbVcd0lbSPEI7RTYv0A5gXbWqhEv7W75O3Ac+JNNK/08eisTu/jwkN18SWtxRzMGKDLU8gNhgQCT06v1XxquebrUvebciSVlbzpW+5vrhMwhMXA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781170904; c=relaxed/simple;
	bh=gs29JVYoqBRbD7XbXz5ZIYaa4W+R/0h/qmCJb0z6MrQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fgvnalTZGbnUvQq+/ZgA3US0SPcLkFiw9Eyapkmr4wmn0DPYdEb97pNc26Ub0uXZ4VkpjEJx4v5YLz0XrbDcnszRvxdcKW59rpAzS02nGcsiZHyRC9hV5lSwM2yVVD3cGlr162tmoUqO0ODEqevwbqJJwHM1qbvQFXsb1eJye+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QgR43M+J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cFnPZbE9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QgR43M+J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cFnPZbE9"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GMs12248055
	for <linux-clk@vger.kernel.org>; Thu, 11 Jun 2026 09:41:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OsmgSByejwZrCh97iurQ7ytYSxygMHrNyrSm1o7mkBk=; b=QgR43M+J55gTURjk
	Rg2FWjzuyB7bLsejkZh8yl4h++Uj29cnSBh6Y66KBz6j9civNb+dhHoPpxMEPwE1
	tvYVB9/kudR12FCb68lSgXyb7eQ6rmkezCfjm1FmUcryIKA7dfzCg1rwv33NgGb8
	y0YzgYZCb7h2UpFKknxlsnzzmqZkJnh+dckQk39BYuAHjC76RTjnZTl8YX5lUeD+
	u3QcXcJYf7GwSyzeLsQlK/G/M9xIVfETfd4T2xQqpk8Ll/pE8R+zaHFSI5n1+bC3
	s5XxmYtxknuI666vy7fq8aVfsDo4hkgPjBiU8Ar0+1mQrovsrWZjAdO5i8f/tcz+
	kk4Bpg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe79jq2m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 11 Jun 2026 09:41:42 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51759082206so23103641cf.3
        for <linux-clk@vger.kernel.org>; Thu, 11 Jun 2026 02:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781170902; x=1781775702; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OsmgSByejwZrCh97iurQ7ytYSxygMHrNyrSm1o7mkBk=;
        b=cFnPZbE9qa9dhkKxIWQw+SUe+5pnGnVdqNdx7UYq2tFziOF6+qdgBDpHo1GMHKapWz
         kMBFzQ5WZQY7ZoxW3jyu9NAEtNUSJXX3OlrmfJ/Hp1qzOIDkNkL52zj2UP+gYvh1eX88
         mE+KFHfL0JmfCNj7XpSAEeFEEloQvrKVChD8uZRK5uCjXViJIVl71NBoAK+Kem4NkqMb
         YAJYSde3dVKw/P/sn9817XsFR/pgeyOfsvrZPJVwk4Efa9xDEhC06QM3LyOKNaLJ4xmi
         wwA9x7F+3JURi/ih2ADQGliL0yC6qeqwvTxcvVpW9ZqixaWJ2G8GXjfiMrHC8hhACM88
         H5Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781170902; x=1781775702;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OsmgSByejwZrCh97iurQ7ytYSxygMHrNyrSm1o7mkBk=;
        b=qwneNn/G7xMC6BGznFlBBeJsNScPcL2ap2ODjgLiW6Q9p1iig2FGB5z36glNghHwiI
         YKvl0Tsf3O8tOLxOW+GrgZlyOHEzw/AKiRsaz3eaQDZM3IWjUOFOXdPlfRMLq5D7v1hH
         HmeTKsC/vZaPPpZIXoH5B0jTnnzoLMQtHLt24xaKGA5JVYocPv2dFGDafXgDA/wGX6PN
         QyhZy/G6M+GWSoUh9Ye2MXWm/rmYlYYEdPsHxV4O//18TV9R7YgfWrmmhEI6VFQAAGcn
         6e+TF7vMTaFHYFmaW2n0LIaMn78OZyBDpHSvwhIJSx0wfDVtGNRakjNFVgv2/LfvbWgB
         9yMA==
X-Gm-Message-State: AOJu0Yw0uD1m3UO+omTqiOnbhbyGqJkIlIjW5qIqA073r+BV1Q+VubXt
	wZ4BIeJMGH/DGodXax26TNzmdFdy+9Ii/seUGkmysOUSXAABmJQP4MZx/Hgx9Z8vzs1xPuCu2jH
	bSl412t8+3ZS6s5e5wAUO1rZF/adm+SUZbbVqXguBaskLSbnxEvNZk+lOm0N2R6s=
X-Gm-Gg: Acq92OFc2d2Vz8nUXzBO3z7RngmXZcxtdfUTP5zE6w1w2jz8VG3dRugSq2ZrV0mtYFX
	eGbDDn48ZqAgC4LkQgrGM+y6RqchUyJn4aACXgCLYoMioJQm8tMkXfm6XSLv5mZtIdGNyx+5jry
	ciGXyKr86GwZP7irtOrcDAKrrRt6GbJdI1M4JrzrVn8/BylMKuu3Ub08o1mQ6vr2NRms8f2Zz+n
	iPaAxn9FBx7Uw/NwPgnDNdMCtlVXo0IDbj7yvROnQuxeLj3zv/Zu3mXjFdpw7y6Ywes8FPO8Ccb
	S/2+y445yt3vxhapHmP7U8Rt7Qdqc8qw6i+W3CP/681LwVFxs7OkLiQT4eDG2JI3tFX2FFyyh+D
	4ByIuOGYG8+sOl/9tVutp9Ysij0Fd+Vfsoqc1OPGcoilB5wmEgjnmCdys
X-Received: by 2002:a05:622a:1449:b0:517:8999:6c4b with SMTP id d75a77b69052e-517ee262f43mr19341721cf.7.1781170901790;
        Thu, 11 Jun 2026 02:41:41 -0700 (PDT)
X-Received: by 2002:a05:622a:1449:b0:517:8999:6c4b with SMTP id d75a77b69052e-517ee262f43mr19341481cf.7.1781170901370;
        Thu, 11 Jun 2026 02:41:41 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb58cf947sm40282866b.43.2026.06.11.02.41.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 02:41:40 -0700 (PDT)
Message-ID: <fe6bab50-f839-48ec-a393-ba0243baf5c0@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 11:41:38 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/15] clk: qcom: rpm: use clk_determine_rate_noop()
To: Brian Masney <bmasney@redhat.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org
References: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
 <20260505-clk-determine-rate-noop-v3-5-f3f829fbacdf@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260505-clk-determine-rate-noop-v3-5-f3f829fbacdf@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: TuBhC0Tluxpzik77vGunHvypWY5hGM9Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA5NiBTYWx0ZWRfX7Wos3lx37aks
 lIDDERH5a1RnqZ5lrXpBzSPdSinUi6+V0xIjQtQf9bwaM2ULo1Toy8U13wrQLNsk/l2uqeIjcZh
 1kr1xsPM1/ZZW78dEJHd3sPnc+hhUq6iuXi0O7HLdudOP49TZHAJHkHu5eSf+tsFpo23zNEtyrQ
 1uQ6rImEoc9PbY/BRQkAePjP7Y1F6K+HLHFvgL/2s6QcLz9MDKVJnOIEqUM7woVF8AHGVuQ3coV
 AE3Kibpg7m3P6G9hBh7270YS61YsAiJgGmsgVhutEnP01Wa5Yscb2l5rE3C3MYMqj9bwzPKkubK
 9ToX3aog0xTAPxArImecZxt3ZIDdMdU+6vCAGXkxHRmgdgk54i7RHC3n2jvEKBIB03gdBBnqP97
 1Yk1Tfz+UOZ4pHe0jFdJj/aINmUB3t/tRgZ93P0qEGzD0Du9+96hiLLzDwYE3oxf/1mDlV1t3Iv
 QT116kVE3QfB/mjAcAw==
X-Proofpoint-GUID: TuBhC0Tluxpzik77vGunHvypWY5hGM9Z
X-Authority-Analysis: v=2.4 cv=fbydDUQF c=1 sm=1 tr=0 ts=6a2a82d6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=yiv6Am5jRSTGblAyIcUA:9 a=QEXdDO2ut3YA:10
 a=tYq66TkwoL4A:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA5NiBTYWx0ZWRfX8nWA8hcLCsaD
 Ou/jmZmQnnxc9yCXVXKbd9Fw/0Xzw8WO2WWsBQtIJnvVYKwxarRNOt2qYhKZ2l2xT0RtPAFUIrF
 sqaEF93DGPMllcVj2E6f/X7qvlAYz4Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110096

On 5/6/26 2:49 AM, Brian Masney wrote:
> Drop the driver-specific empty determine_rate() function and use the new
> shared clk_determine_rate_noop() helper.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
