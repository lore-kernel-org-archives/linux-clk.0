Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922553DD86F
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 03:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791860954; cv=none; b=qTf4KYBGYIE/6BGIh/UKBW6+NyOFc32b5EcZVP6Kf9fdg43Ha9UQeLw3tVgHV0diOXn1syAPuPpP9S4mHkcg93BG0PqaPc4h1PqbZu5shlusrEzZLnhbOcKLBCNxEeXyXtdgKuOHKlXB1BRkqd5+/aFUPa278KqTI3+K5HEprC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791860954; c=relaxed/simple;
	bh=2DaEZecYbqzdkows3wlJT/6rHLkdPtQeCKBsVysIRa8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qo7sRa9XdTStQm+GRQWB97IWWQS8EoMo43OZpTOuZo4GqSwwgnDKOH3eLtmaPwAdLe4EhXHXsQCqUaMqj7HtmzT1h33oBMDBj6hzlNuHIsRRfYXY+jY5re9wDWukvPd3muimuSvosqmPJZdCxB6LCpQqyUFcLBJEY4a6up56OXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ONMnEjSd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TnyhHrjL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ONMnEjSd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TnyhHrjL"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D20nWt988787
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 03:09:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5ROHOyfkd+2sJ+PYo6ghhU3d
	bvpfdOhK3QHU5GiExA8=; b=ONMnEjSdkFsg84qr8BwvQxnBWKmAH3jxBFV5+zi2
	I3OBTb2gsYOCkOLQsza4JVDkYskdHF30qLwAb/hI0/CqzEJL3csUFxrhYEuNRPDG
	HgoUrx1HXk7ZMVnZPYwmaF65tVltAKC4TfuUwzAcFai9QdTuI6MaPEiGsXxhVSN5
	zz00O28Ui/H8kuhETuzmALvIJc3Z5e73qRpcbLYTxuP+y50YaaqJ5z/JOXspGa4Y
	YFYqnfZ37y36/8sHn4nYRD8acy6lKxbbRMXl7xPoRRv3RVhcA99qNjf79Kc8lxKD
	D05k0SZMRBA5TsO5IY85KYCOwCuIUlXA6HGfzSC+HVYe0g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98hc8rts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 03:09:05 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3548cdfd2fbso4051330eec.1
        for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 20:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791860945; x=1792465745; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5ROHOyfkd+2sJ+PYo6ghhU3dbvpfdOhK3QHU5GiExA8=;
        b=TnyhHrjL8Ugndz5knosCKFfIEdMCpHImqUFhIWqkwxW5rFGPK9drcfEE3hyYtAP8PK
         wCMVxy8MfJ3zWPVtzKWAWtI+Awgms76+IBE84AA3rLgt2DbmnnZyY267hAXKfk+Wg1BL
         RLvD59pvO6VFSAo0fYJj+u35yUj5R42AqzgrYsjWV15nRuQCB6zLhds2hocTFVe7sSGM
         hg54yT6H3/cvjKn/qT4Jn/UwhlKLTlH0w2VWwNxvnZriMXIDVy4RWU6vI3aEghs8/URt
         ebh/XVCo+QNOMhk33JX4JQ1iWcKhC/DM/7dpZ9rrBWJcwvTRsVlRoLHD5mvvVn5SVTfi
         gsWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791860945; x=1792465745;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5ROHOyfkd+2sJ+PYo6ghhU3dbvpfdOhK3QHU5GiExA8=;
        b=jM09f9XJCEWCCgnD1BwX4Z2D6V7aU5m9ZRfBzE69w+ON1LP0VBaQXcN4vXDEQT7xTm
         HUyZbwIwQeFe6lraPPGKuxelTSWBM3E18bpw9zcd3tKK2nkJHGoea2xnZT7sT8qQwepo
         UM2A+sZzSpMPIMnAAur4Tu8Y3kv048dqeootfht6cZRCwT2mNQ0lPpyCtaJBB5neNpLB
         AhXyWw745y4fFjvQZJtrvc1xMrTPTT0hvyh6GjGkz5aBpnsssdBeq0FNrFB7eeMuA+9v
         nIWkhvueeLYd1LcOdWDYz6lfR5pMOMdAMgT4ZySDEY76enWp7erE/JG9DAi3RNX3BnW7
         GgEA==
X-Forwarded-Encrypted: i=1; AKwUvByvW47LW+TQuaN1u3FV24mJcF7b30HiiRyWMwJ5EsZUaH8kEKhA4/IWzJMxizDUhdiecyvQJFdH340=@vger.kernel.org
X-Gm-Message-State: AFq9FYIsmxH8m3BG1wLngzvrTn/dodiuVfeZ1YkIxg1P2E8BIbqo+QOq
	JDunmh3fyaK6my803g06KrUvyeZel/0Hegfo9xlq+V34kh+egC6lnN9mhD+muMRXWnYbZ6e2HLK
	6L3FN44DrbYhTf5wVSOIK84aV7rQokKsY0TEodkeilbmjsdj36e6cRnJP0YS123c=
X-Gm-Gg: AYBFou3M2M3LkCfWv456dS0R+Ha3NFVqiKWGb+jKoNrcKxSPBNDZV3Pld0NEwFDx/UT
	S9sAqW5vEnjz7efUd8QEe1YT7DfKJ+GhtkX10Z7H0054OUVbDcOjLbsh+xqkg1yYi3A5j0I5MpW
	8CAvS3TtjcLoNyVeDOazD4V0kts1PN5EcOnCzBa5pQvwguH/xACDYlGte9NeNUPmBPFDOUN7UBm
	DJi9TuRCf/27hsuVFaMrgCRXMsrCZX2g4TdYUdOxDb2lvGfch0xitPqHkhryoFKmT1MSIv+gCmk
	AsF/8f0ojTXQ117YAaO6RBU1jGV1TS9ap/AcXmsUMDPtfBXCwGUq+ZwCl43ack52YCRNcpJZuMv
	O6jwZB+bFu9r9tEXRZuMCe0fDDoh23EfL4xOlF8cd9g==
X-Received: by 2002:a05:701b:4202:10b0:143:50a0:56be with SMTP id a92af1059eb24-16a5fc910e2mr14712382c88.14.1791860944821;
        Mon, 12 Oct 2026 20:09:04 -0700 (PDT)
X-Received: by 2002:a05:701b:4202:10b0:143:50a0:56be with SMTP id a92af1059eb24-16a5fc910e2mr14712344c88.14.1791860944031;
        Mon, 12 Oct 2026 20:09:04 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca6d202sm37060349eec.13.2026.10.12.20.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 20:09:03 -0700 (PDT)
Date: Tue, 13 Oct 2026 11:08:56 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Alexandre Mergnat <amergnat@baylibre.com>
Subject: Re: [PATCH v3 2/6] clk: qcom: negcc-nord: keep GPU2 CFG clock
 enabled via critical CBCR
Message-ID: <as2gyLK95eXM0WgM@QCOM-aGQu4IUr3Y>
References: <20260724-nords_mm_v1-v3-0-32b45232217f@oss.qualcomm.com>
 <20260724-nords_mm_v1-v3-2-32b45232217f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724-nords_mm_v1-v3-2-32b45232217f@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAxMiBTYWx0ZWRfXx2hjtYa5zDUA
 WDoYZy9DtzAhdwLhe2xp7QOuOqBWW2cut6yGbwO8lilbZugjXIOKopyqDo/b4GK5BM1wsaDxyQ4
 gpXuLcuizKj0JjZr4ONoK7JhyA8aOGFirGc5BJXEyxKmDShn1N8UcVoVIzvjz8NDiNo7PyJbIr0
 V4MmSZazkFaY9TYQXnC7EUz5gk6AioTyzN0ZalkHiMVsAambwFEHXsM3HwzTDnSU9j3cj4cS/u6
 NYVOlBOXJkGYCYS9rQiOd+qqcqWwybEv9vnKommzx3yDY5Cwynve5f0kNHYzwVI9D05nLb989Nr
 ZAyLjasd308Lwab+n8MVtee4Zhcn5/e+c2kKoEJUpKIrUUBHHZg/QntRBBwFDyKz8Ak7geIA6EV
 wWf9MpGm/PR/5HLFLlbdhYDlt5Xs1Hjw1UfUIEVisRzHyJHA+QSisqpGvhe4E5pJaEr04XL/nsl
 clJKNbkxkFXklye0fHg==
X-Authority-Analysis: v=2.4 cv=VPVIDNPX c=1 sm=1 tr=0 ts=6acda0d1 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=IpJZQVW2AAAA:8 a=yUjrznqbfBiV5e72-0MA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-ORIG-GUID: vC0NzwSYEYp7oufK14HLww4VtOZhVNT-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAxMiBTYWx0ZWRfX6MrRVZ7Elun+
 AhbjqQ0wtnz0D7/RK6mfld6+gHskS9cku5Vt94Ekg2klVbFvIRLx/t7LopCZkDYHOzuLvkLZK6D
 vHrEW8s2hgD3J+4+lfJrhwe3dhV3jjA=
X-Proofpoint-GUID: vC0NzwSYEYp7oufK14HLww4VtOZhVNT-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130012

On Fri, Jul 24, 2026 at 04:25:06PM +0530, Taniya Das wrote:
> The GPU2 CFG clock must remain enabled for correct operation and
> should not be exposed as a controllable clk_branch.

Hi Taniya,

Could you share a bit more information why this is the case? I do not
seem to get any problem when testing without this change.

Shawn

> 
> Remove the clk_branch and mark its CBCR as critical instead to
> prevent unintended gating. This follows the same approach as
> 'nw_gcc_gpu_cfg_ahb_clk' and aligns with other always-on clocks in
> Qualcomm CC drivers.
> 
> Fixes: a4f780cd5c7a ("clk: qcom: gcc: Add multiple global clock controller driver for Nord SoC")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/negcc-nord.c | 22 ++++++----------------
>  1 file changed, 6 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/clk/qcom/negcc-nord.c b/drivers/clk/qcom/negcc-nord.c
> index 2e653ef0fe0e304f09ed354d5578fdbed9151d20..bc4d478d5606ad7478431573f98b62f6f9b7d9fb 100644
> --- a/drivers/clk/qcom/negcc-nord.c
> +++ b/drivers/clk/qcom/negcc-nord.c
> @@ -952,21 +952,6 @@ static struct clk_branch ne_gcc_gp2_clk = {
>  	},
>  };
>  
> -static struct clk_branch ne_gcc_gpu_2_cfg_clk = {
> -	.halt_reg = 0x34004,
> -	.halt_check = BRANCH_HALT_VOTED,
> -	.hwcg_reg = 0x34004,
> -	.hwcg_bit = 1,
> -	.clkr = {
> -		.enable_reg = 0x34004,
> -		.enable_mask = BIT(0),
> -		.hw.init = &(const struct clk_init_data) {
> -			.name = "ne_gcc_gpu_2_cfg_clk",
> -			.ops = &clk_branch2_ops,
> -		},
> -	},
> -};
> -
>  static struct clk_branch ne_gcc_gpu_2_gpll0_clk_src = {
>  	.halt_check = BRANCH_HALT_DELAY,
>  	.clkr = {
> @@ -1817,7 +1802,6 @@ static struct clk_regmap *ne_gcc_nord_clocks[] = {
>  	[NE_GCC_GPLL0] = &ne_gcc_gpll0.clkr,
>  	[NE_GCC_GPLL0_OUT_EVEN] = &ne_gcc_gpll0_out_even.clkr,
>  	[NE_GCC_GPLL2] = &ne_gcc_gpll2.clkr,
> -	[NE_GCC_GPU_2_CFG_CLK] = &ne_gcc_gpu_2_cfg_clk.clkr,
>  	[NE_GCC_GPU_2_GPLL0_CLK_SRC] = &ne_gcc_gpu_2_gpll0_clk_src.clkr,
>  	[NE_GCC_GPU_2_GPLL0_DIV_CLK_SRC] = &ne_gcc_gpu_2_gpll0_div_clk_src.clkr,
>  	[NE_GCC_GPU_2_HSCNOC_GFX_CLK] = &ne_gcc_gpu_2_hscnoc_gfx_clk.clkr,
> @@ -1946,10 +1930,16 @@ static void clk_nord_regs_configure(struct device *dev, struct regmap *regmap)
>  	qcom_branch_set_force_mem_core(regmap, ne_gcc_ufs_phy_axi_clk, true);
>  }
>  
> +static const u32 ne_gcc_nord_critical_cbcrs[] = {
> +	0x34004, /* NE_GCC_GPU_2_CFG_CLK */
> +};
> +
>  static const struct qcom_cc_driver_data ne_gcc_nord_driver_data = {
>  	.dfs_rcgs = ne_gcc_nord_dfs_clocks,
>  	.num_dfs_rcgs = ARRAY_SIZE(ne_gcc_nord_dfs_clocks),
>  	.clk_regs_configure = clk_nord_regs_configure,
> +	.clk_cbcrs = ne_gcc_nord_critical_cbcrs,
> +	.num_clk_cbcrs = ARRAY_SIZE(ne_gcc_nord_critical_cbcrs),
>  };
>  
>  static const struct qcom_cc_desc ne_gcc_nord_desc = {
> 
> -- 
> 2.34.1
> 
> 
