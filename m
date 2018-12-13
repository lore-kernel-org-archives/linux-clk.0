Return-Path: <SRS0=bPXJ=OW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D135C67839
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 19:49:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 387ED2086D
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 19:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1544730584;
	bh=jzF+YI0Eb2Fk8MBib/yKIGYW9W+LW8R3ZqFnKFGi0/Q=;
	h=In-Reply-To:Subject:To:References:From:Cc:Date:List-ID:From;
	b=mKpxjN45siTSSH1TKcmmZQ6BcRCZJ385ub01pGbnhpSxUuO6+BgI4LDNxlUTw7ZVS
	 lKYh8iKg3kDMQLa8tZjxGKsoKEsQOXlUJSwcvzBlODQePK6fDjTAaYf0uJaxOhMOqn
	 RDxWeX1dmqpjrcSO/7KLRP04X3rZneiq6ieLZKKM=
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 387ED2086D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728421AbeLMTti (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Dec 2018 14:49:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:35828 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728128AbeLMTti (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 13 Dec 2018 14:49:38 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 656562086D;
        Thu, 13 Dec 2018 19:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1544730577;
        bh=jzF+YI0Eb2Fk8MBib/yKIGYW9W+LW8R3ZqFnKFGi0/Q=;
        h=In-Reply-To:Subject:To:References:From:Cc:Date:From;
        b=ihe9QvHJn8gO1jtkh6vkQEYzvpYjCZ12C3n+grXJ7NLhxm8rA+uKN9TYgqrYbQkRU
         +gmNhbt2UpJitYqzbOmAlBIicikF8r/BcD8IYggPA5sGnMr52rOD+iAJR25/aVayBn
         JgaECW7xQ26sfIVOqFql6/mi3rIDVgIYixt45ezc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20181206215858.3880-9-sboyd@kernel.org>
Subject: Re: [PATCH 8/8] clk: Loongson1: Remove usage of CLK_IS_BASIC
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
References: <20181206215858.3880-1-sboyd@kernel.org> <20181206215858.3880-9-sboyd@kernel.org>
Message-ID: <154473057668.19322.13374984983396347221@swboyd.mtv.corp.google.com>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Date:   Thu, 13 Dec 2018 11:49:36 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Stephen Boyd (2018-12-06 13:58:58)
> This flag doesn't look to be used by any code, just set in the clk init
> structure and then never tested again. Remove it from this driver as it
> doesn't provide any benefit. Also remove parenthesis nearby that are not
> needed and include clk.h to fix a sparse warning about static function
> definition.
>=20
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>
> ---

Applied to clk-next

