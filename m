Return-Path: <SRS0=NpU+=O5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E82E0C43387
	for <linux-clk@archiver.kernel.org>; Thu, 20 Dec 2018 19:43:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 91A8D218D3
	for <linux-clk@archiver.kernel.org>; Thu, 20 Dec 2018 19:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1545334993;
	bh=FMIPnEbtE3q3owGnl6WP/XbMONDJnndNXxzqNX5Cq4Q=;
	h=To:References:Cc:From:In-Reply-To:Subject:Date:List-ID:From;
	b=HGTGwQirJaVBT3mMZb+BP/r6Q62lzUmbAwJph+PrQn7ikx6BOeT0gN6Up7ZvSElcW
	 d7cvSS2Se194DQjlPvaUPfTrGM6xLqjO7F7aYA5fUTsFwmvnT0oooQD0QiQfXWolIg
	 q2bXQxx2vvo7YXvfAMxsOPAe0j9TUP6cFdafjlag=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388959AbeLTTnM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 20 Dec 2018 14:43:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:47254 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731429AbeLTTmn (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 20 Dec 2018 14:42:43 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 537F5218D3;
        Thu, 20 Dec 2018 19:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1545334963;
        bh=FMIPnEbtE3q3owGnl6WP/XbMONDJnndNXxzqNX5Cq4Q=;
        h=To:References:Cc:From:In-Reply-To:Subject:Date:From;
        b=lcvihoxnJiIZYH5BoTOC7Hv5QB6yJwCoukZWZ/aThddx/GIsRLEUJv4Yi70DotHki
         V69T2/Pc7Zyepae7C5V08agzuliLx04cOXgvkVgaGOm3IJkXdgxacLZTIIWD7Ef8eo
         w+PzhMhsE7IxSiQ80Sxm+sj+liSinZsJYiDVCMrY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
User-Agent: alot/0.8
To:     Alexander Shiyan <shc_work@mail.ru>, linux-clk@vger.kernel.org
References: <20181220085433.20334-1-shc_work@mail.ru>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Alexander Shiyan <shc_work@mail.ru>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20181220085433.20334-1-shc_work@mail.ru>
Message-ID: <154533496261.79149.8151013115299125376@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] clk: clps711x: Remove board support
Date:   Thu, 20 Dec 2018 11:42:42 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Alexander Shiyan (2018-12-20 00:54:33)
> Since board support for the CLPS711X platform was removed,
> remove the board support from the clk-clps711x driver.

Can you reference the commit where the platform was removed in the
commit text here? It helps me know if there are dependencies.

