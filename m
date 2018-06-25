Return-Path: <david@lechnology.com>
To: Stephen Boyd <sboyd@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>
Cc: =?UTF-8?Q?Bartosz_Go=c5=82aszewski?= <bgolaszewski@baylibre.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, Sekhar Nori <nsekhar@ti.com>,
 linux-clk@vger.kernel.org
From: David Lechner <david@lechnology.com>
Subject: [GIT PULL] clk-davinci-fixes-for-4.18
Message-ID: <cc5f17ab-314f-d419-bcfc-04c8e4c2e85b@lechnology.com>
Date: Mon, 25 Jun 2018 18:59:07 -0500
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

The following changes since commit ce397d215ccd07b8ae3f71db689aedb85d56ab40:

   Linux 4.18-rc1 (2018-06-17 08:04:49 +0900)

are available in the Git repository at:

   https://github.com/dlech/linux.git tags/clk-davinci-fixes-4.18

for you to fetch changes up to 176cbf5f62e7a0aa0180af4826da9e7da1359988:

   clk: davinci: fix a typo (which leads to build failures) (2018-06-25 18:09:57 -0500)

----------------------------------------------------------------
clk: davinci: fixes for 4.18

Here are a couple of typo fixes for clk-davinci for 4.18.

Technically, there are not any users of clk-davinci yet in 4.18, so this can
wait until 4.19 if that is easier.

Signed-off-by: David Lechner <david@lechnology.com>

----------------------------------------------------------------
Bartosz Golaszewski (1):
       clk: davinci: fix a typo (which leads to build failures)

Dan Carpenter (1):
       clk: davinci: cfgchip: testing the wrong variable

  drivers/clk/davinci/da8xx-cfgchip.c | 2 +-
  drivers/clk/davinci/psc.h           | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
