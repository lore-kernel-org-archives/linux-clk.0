Return-Path: <nicolas.dechesne@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1428069603-2641-1-git-send-email-georgi.djakov@linaro.org>
References: <1428069603-2641-1-git-send-email-georgi.djakov@linaro.org>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Fri, 3 Apr 2015 16:14:41 +0200
Message-ID: <CAP71WjwsNSJH8F1Cw0CFfQmPiTh7MxMVW=0W5OwuQz1Gz1OgPw@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: Fix parent_map translations
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Mike Turquette <mturquette@linaro.org>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Fri, Apr 3, 2015 at 4:00 PM, Georgi Djakov <georgi.djakov@linaro.org> wrote:
> When we introduced the parent_map tables, we missed to update some
> of the functions where mapping is translated. Fix this.
>
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>

thanks. I've tested this patch on top of [1] which was used when the
initial problem was reported/detected. and this branch had the faulty
commit:

commit 23cdacef13714d17d28b51fa942937b619203f24
Author: Georgi Djakov <georgi.djakov@linaro.org>
Date:   Fri Mar 20 18:30:26 2015 +0200

    clk: qcom: Introduce parent_map tables


I've tested sd, emmc, display and gpu, so

Tested-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>

[1] https://git.linaro.org/landing-teams/working/qualcomm/kernel.git/shortlog/refs/heads/integration-linux-qcomlt
