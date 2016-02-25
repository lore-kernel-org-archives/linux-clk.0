Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:50364 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751968AbcBYWdT (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 25 Feb 2016 17:33:19 -0500
Date: Thu, 25 Feb 2016 14:33:16 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Matthew McClintock <mmcclint@qca.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	Varadarajan Narayanan <varada@codeaurora.org>,
	linux-kernel@vger.kernel.org,
	qca-upstream.external@qca.qualcomm.com,
	Pradeep Banavathi <pradeepb@codeaurora.org>,
	Senthilkumar N L <snlakshm@codeaurora.org>,
	Matthew McClintock <mmcclint@codeaurora.org>,
	Andy Gross <andy.gross@linaro.org>
Subject: Re: [PATCH v3 2/6] clk: qcom: Add IPQ4019 Global Clock Controller
 support
Message-ID: <20160225223316.GN4847@codeaurora.org>
References: <1447975173-29485-1-git-send-email-mmcclint@qca.qualcomm.com>
 <1447975173-29485-3-git-send-email-mmcclint@qca.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1447975173-29485-3-git-send-email-mmcclint@qca.qualcomm.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 11/19, Matthew McClintock wrote:
> From: Varadarajan Narayanan <varada@codeaurora.org>
> 
> This patch adds support for the global clock controller found on
> the IPQ4019 based devices. This includes UART, I2C, SPI etc.
> 
> Signed-off-by: Pradeep Banavathi <pradeepb@codeaurora.org>
> Signed-off-by: Senthilkumar N L <snlakshm@codeaurora.org>
> Signed-off-by: Varadarajan Narayanan <varada@codeaurora.org>
> Signed-off-by: Matthew McClintock <mmcclint@codeaurora.org>
> ---

Applied to clk-ipq4019 and merged into clk-next.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
